#!/usr/bin/env python3
from pathlib import Path
import re
import sys

Q = 12289
Q0I = 12287
N = 1024

ROOT = Path(__file__).resolve().parents[1]
UART_LOG = ROOT / "build/x-heep_systems_gr-heep_0/sim-verilator/uart0.log"
IGMB_DAT = ROOT / "hw/vendor/PQC_Falcon/impl_FPGA/optimized/INTT/maxi/ip/hdl/verilog/iNTT_intt_stage_iGMb_ROM_AUTO_1R.dat"


def mq_add(a, b):
    x = a + b - Q
    return x + Q if x < 0 else x


def mq_sub(a, b):
    x = a - b
    return x + Q if x < 0 else x


def mq_montymul(x, y):
    t = x * y
    m = ((t * Q0I) & 0xFFFF) * Q
    t = (t + m) >> 16
    t -= Q
    return t + Q if t < 0 else t


def load_dat(path):
    vals = []
    for raw in path.read_text().splitlines():
        line = raw.split("//", 1)[0].strip()
        if not line:
            continue
        for part in line.replace(",", " ").split():
            if part.startswith("@"):
                continue
            if part.lower().startswith("0x"):
                vals.append(int(part, 16) % Q)
            elif re.fullmatch(r"[0-9a-fA-F]+", part):
                vals.append(int(part, 16) % Q)

    if len(vals) < N:
        raise RuntimeError(f"iGMb ROM corta: {len(vals)} valores")

    return vals[:N]


def intt_stage(inp, igmb, t, m):
    out = [0] * N
    hm = m >> 1

    for n in range(512):
        i = n + ((n // t) * t)
        gm = igmb[hm + (n // t)]

        u = inp[i]
        v = inp[i + t]

        out[i] = mq_add(u, v)
        out[i + t] = mq_montymul(mq_sub(u, v), gm)

    return out


def intt_ref(a, igmb):
    x = a[:]
    x = intt_stage(x, igmb, 1, 1024)
    x = intt_stage(x, igmb, 2, 512)
    x = intt_stage(x, igmb, 4, 256)
    x = intt_stage(x, igmb, 8, 128)
    x = intt_stage(x, igmb, 16, 64)
    x = intt_stage(x, igmb, 32, 32)
    x = intt_stage(x, igmb, 64, 16)
    x = intt_stage(x, igmb, 128, 8)
    x = intt_stage(x, igmb, 256, 4)
    x = intt_stage(x, igmb, 512, 2)

    # Normalización final out_copy() del HLS.
    ni = 4091
    size = N
    while size > 1:
        if ni & 1:
            ni += Q
        ni >>= 1
        size >>= 1

    return [mq_montymul(v, ni) for v in x]


def uart_intt16():
    text = UART_LOG.read_text(errors="replace")
    m = re.search(r"INTT16((?:\s+\d+){16})", text)
    if not m:
        raise RuntimeError("No encontré línea INTT16 en uart0.log")
    return [int(x) for x in m.group(1).split()]


def main():
    igmb = load_dat(IGMB_DAT)

    # Mismo input que main.c: mod_q(i + 1)
    inp = [(i + 1) % Q for i in range(N)]
    golden = intt_ref(inp, igmb)
    hw16 = uart_intt16()

    golden16 = golden[:16]
    shifted16 = [(v + 4095) % Q for v in golden16]

    print(f"UART first 16:        {hw16}")
    print(f"Golden first 16:      {golden16}")
    print(f"Golden+4095 first 16: {shifted16}")
    print(f"First16 match:        {hw16 == golden16}")
    print(f"+4095 match:          {hw16 == shifted16}")

    if hw16 == golden16:
        print("Direct HLS iNTT1024 vs golden software first16: OK")
        return 0

    if hw16 == shifted16:
        print("Direct HLS iNTT1024 vs golden software first16 + offset 4095: OK")
        return 0

    print("Direct HLS iNTT1024 vs golden software first16: FAILED")
    return 1


if __name__ == "__main__":
    sys.exit(main())
