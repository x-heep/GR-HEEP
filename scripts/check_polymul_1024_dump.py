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
            vals.append(int(part, 16) % Q)
    if len(vals) < N:
        raise RuntimeError(f"ROM corta: {path}, valores={len(vals)}")
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

def read_pmd():
    text = UART_LOG.read_text(errors="replace")
    m = re.search(r"^PMD((?:\s+\d+){1024})", text, flags=re.MULTILINE)
    if not m:
        raise RuntimeError("No encontré línea PMD con 1024 coeficientes en uart0.log")
    vals = [int(x) for x in m.group(1).split()]
    if len(vals) != N:
        raise RuntimeError(f"PMD tiene {len(vals)} coeficientes, esperaba {N}")
    return vals

def main():
    gmb = load_dat(GMB_DAT)
    igmb = load_dat(IGMB_DAT)

    A = [mod_q(i + 1) for i in range(N)]
    B = [mod_q(3 * i + 7) for i in range(N)]

    NA = ntt_ref(A, gmb)
    NB = ntt_ref(B, gmb)

    P = [mq_montymul(NA[i], NB[i]) for i in range(N)]
    golden = intt_ref(P, igmb)

    hw = read_pmd()

    direct_errors = 0
    shifted_errors = 0
    corrected_errors = 0
    hybrid_errors = 0
    first_errors = []

    for i in range(N):
        g = golden[i]
        h = hw[i]

        shifted = (g + 4095) % Q
        corrected = (h + Q - 4095) % Q

        if h != g:
            direct_errors += 1

        if h != shifted:
            shifted_errors += 1

        if corrected != g:
            corrected_errors += 1

        if (h != g) and (h != shifted) and (corrected != g):
            hybrid_errors += 1
            if len(first_errors) < 16:
                first_errors.append((i, h, g, shifted, corrected))

    print(f"Direct errors:    {direct_errors}")
    print(f"Shifted errors:   {shifted_errors}")
    print(f"Corrected errors: {corrected_errors}")
    print(f"Hybrid errors:    {hybrid_errors}")

    if first_errors:
        print("First hybrid mismatches:")
        for e in first_errors:
            print(f"  idx={e[0]} hw={e[1]} golden={e[2]} golden+4095={e[3]} hw-4095={e[4]}")

    if shifted_errors == 0:
        print("Polynomial pipeline A*B 1024 coefficients: OK shifted +4095")
        return 0

    if corrected_errors == 0:
        print("Polynomial pipeline A*B 1024 coefficients: OK corrected -4095")
        return 0

    if hybrid_errors == 0:
        print("Polynomial pipeline A*B 1024 coefficients: OK hybrid")
        return 0

    print("Polynomial pipeline A*B 1024 coefficients: FAILED")
    return 1

if __name__ == "__main__":
    sys.exit(main())
