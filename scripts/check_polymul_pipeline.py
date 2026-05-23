#!/usr/bin/env python3
from pathlib import Path
import re
import sys

Q = 12289
Q0I = 12287
N = 1024

ROOT = Path(__file__).resolve().parents[1]
UART_LOG = ROOT / "build/x-heep_systems_gr-heep_0/sim-verilator/uart0.log"
GMB_DAT = ROOT / "hw/vendor/PQC_Falcon/impl_FPGA/optimized/NTT/maxi/ip/hdl/verilog/NTT_ntt_10_stages_GMb_ROM_AUTO_1R.dat"
IGMB_DAT = ROOT / "hw/vendor/PQC_Falcon/impl_FPGA/optimized/INTT/maxi/ip/hdl/verilog/iNTT_intt_stage_iGMb_ROM_AUTO_1R.dat"

def mod_q(x):
    return x % Q

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
        raise RuntimeError(f"ROM corta: {path} tiene {len(vals)} valores")
    return vals[:N]

def ntt_ref(a, gmb):
    a = a[:]
    t = N
    m = 1
    while m < N:
        ht = t >> 1
        for i in range(m):
            s = gmb[m + i]
            j1 = i * t
            j2 = j1 + ht
            for j in range(j1, j2):
                u = a[j]
                v = mq_montymul(a[j + ht], s)
                a[j] = mq_add(u, v)
                a[j + ht] = mq_sub(u, v)
        t = ht
        m <<= 1
    return a

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

    ni = 4091
    size = N
    while size > 1:
        if ni & 1:
            ni += Q
        ni >>= 1
        size >>= 1

    return [mq_montymul(v, ni) for v in x]

def uart_pc():
    text = UART_LOG.read_text(errors="replace")

    m = re.search(r"PC\s+(\d+)\s+(\d+)", text)
    if not m:
        raise RuntimeError("No encontré línea PC en uart0.log")

    b = re.search(r"PCB\s+(\d+)\s+(\d+)", text)

    pc = (int(m.group(1)), int(m.group(2)))
    pcb = None if not b else (int(b.group(1)), int(b.group(2)))
    return pc, pcb

def main():
    gmb = load_dat(GMB_DAT)
    igmb = load_dat(IGMB_DAT)

    A = [mod_q(i + 1) for i in range(N)]
    B = [mod_q(3*i + 7) for i in range(N)]

    NA = ntt_ref(A, gmb)
    NB = ntt_ref(B, gmb)

    print(f"Golden NB16: {NB[:16]}")

    P_naive = [mod_q(NA[i] * NB[i]) for i in range(N)]
    P_monty = [mq_montymul(NA[i], NB[i]) for i in range(N)]

    print(f"Golden PW naive 16: {P_naive[:16]}")
    print(f"Golden PW monty 16: {P_monty[:16]}")

    P = P_monty
    C = intt_ref(P, igmb)
    print(f"Golden C16: {C[:16]}")
    print(f"Golden C16+4095: {[(v + 4095) % Q for v in C[:16]]}")
    print(f"Golden C512: {C[512:528]}")
    print(f"Golden C512+4095: {[(v + 4095) % Q for v in C[512:528]]}")

    golden_chk = 0
    golden_shift_chk = 0
    golden_corr_blk0 = 0
    golden_corr_blk512 = 0

    for i, v in enumerate(C):
        golden_chk ^= (v & 0xFFFF)
        golden_shift_chk ^= ((v + 4095) % Q)

        if i < 16:
            golden_corr_blk0 ^= (v & 0xFFFF)

        if 512 <= i < 528:
            golden_corr_blk512 ^= (v & 0xFFFF)

    (hw_direct, hw_corr), hw_blocks = uart_pc()

    print(f"HW direct checksum:        {hw_direct}")
    print(f"HW corrected checksum:     {hw_corr}")
    print(f"Golden checksum:           {golden_chk}")
    print(f"Golden+4095 checksum:      {golden_shift_chk}")
    print(f"Golden corrected block0:   {golden_corr_blk0}")
    print(f"Golden corrected block512: {golden_corr_blk512}")
    if hw_blocks is not None:
        print(f"HW corrected block0:       {hw_blocks[0]}")
        print(f"HW corrected block512:     {hw_blocks[1]}")

    if hw_direct == golden_chk:
        print("Polynomial pipeline A*B vs golden: OK direct")
        return 0

    if hw_corr == golden_chk:
        print("Polynomial pipeline A*B vs golden: OK corrected")
        return 0

    if hw_direct == golden_shift_chk:
        print("Polynomial pipeline A*B vs golden: OK shifted +4095")
        return 0

    print("Polynomial pipeline A*B vs golden: FAILED")
    return 1

if __name__ == "__main__":
    sys.exit(main())
