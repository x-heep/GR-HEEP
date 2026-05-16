from pathlib import Path
import re

Q = 12289
Q0I = 12287
HLS_N = 1024
LOGN = 10

ROOT = Path(__file__).resolve().parents[1]
uart_log = ROOT / "build/x-heep_systems_gr-heep_0/sim-verilator/uart0.log"
gmb_dat = ROOT / "hw/vendor/PQC_Falcon/impl_FPGA/optimized/NTT/maxi/ip/hdl/verilog/NTT_ntt_10_stages_GMb_ROM_AUTO_1R.dat"

def mod_q(x):
    return x % Q

def mq_add(a, b):
    tmp = a + b - Q
    if tmp >> 31:
        tmp += Q
    return tmp & 0xFFFFFFFF

def mq_sub(a, b):
    tmp = a - b
    if tmp >> 31:
        tmp += Q
    return tmp & 0xFFFFFFFF

def mq_montymul(x, y):
    tmp2 = x * y
    tmp1 = ((tmp2 * Q0I) & 0xFFFF) * Q
    tmp2 = (tmp2 + tmp1) >> 16
    tmp2 -= Q
    if tmp2 >> 31:
        tmp2 += Q
    return tmp2 & 0xFFFFFFFF

def golden_mq_ntt(a, gmb):
    n = 1 << LOGN
    t = n
    m = 1

    while m < n:
        ht = t >> 1
        j1 = 0

        for i in range(m):
            s = gmb[m + i]
            j2 = j1 + ht

            for j in range(j1, j2):
                u = a[j]
                v = mq_montymul(a[j + ht], s)
                a[j] = mq_add(u, v)
                a[j + ht] = mq_sub(u, v)

            j1 += t

        t = ht
        m <<= 1

    return a

def bit_reverse_index(x, bits):
    y = 0
    for _ in range(bits):
        y = (y << 1) | (x & 1)
        x >>= 1
    return y

def bit_reverse_permute(v):
    bits = (len(v) - 1).bit_length()
    out = [0] * len(v)
    for i, val in enumerate(v):
        out[bit_reverse_index(i, bits)] = val
    return out

def parse_hls_output(text):
    inside = False
    values = {}

    for line in text.splitlines():
        line = line.strip()

        if line == "HLS_NTT1024_OUTPUT_BEGIN":
            inside = True
            continue

        if line == "HLS_NTT1024_OUTPUT_END":
            break

        if inside:
            m = re.match(r"^(\d+)\s+(\d+)$", line)
            if m:
                values[int(m.group(1))] = int(m.group(2))

    if len(values) != HLS_N:
        raise SystemExit(f"ERROR: esperaba {HLS_N} valores HLS, encontré {len(values)}")

    return [values[i] for i in range(HLS_N)]

def compare(name, got, exp, max_print=8):
    mismatches = []

    for i, (g, e) in enumerate(zip(got, exp)):
        if g != e:
            mismatches.append((i, g, e))
            if len(mismatches) >= max_print:
                break

    if not mismatches:
        print(f"{name}: OK")
        return True

    print(f"{name}: FAILED")
    for i, g, e in mismatches:
        print(f"  mismatch {i}: got {g}, expected {e}")
    return False

def main():
    gmb = [int(x.strip(), 16) for x in gmb_dat.read_text().splitlines() if x.strip()]
    if len(gmb) != HLS_N:
        raise SystemExit(f"ERROR: GMb debería tener {HLS_N} entradas, tiene {len(gmb)}")

    hls = parse_hls_output(uart_log.read_text())

    inp_seq = [mod_q(i + 1) for i in range(HLS_N)]
    exp_seq = golden_mq_ntt(inp_seq[:], gmb)

    inp_dup = [mod_q((i // 2) + 1) for i in range(HLS_N)]
    exp_dup = golden_mq_ntt(inp_dup[:], gmb)

    even = hls[0::2]
    odd = hls[1::2]

    print("HLS first 16:             ", hls[:16])
    print("Expected seq first 16:    ", exp_seq[:16])
    print("Expected dup-in first 16: ", exp_dup[:16])
    print()
    print("Pair duplication check:", "OK" if even == odd else "FAILED")
    print()

    compare("Direct HLS vs NTT1024(seq input)", hls, exp_seq)
    compare("Direct HLS vs NTT1024(dup input)", hls, exp_dup)

    print()
    compare("HLS even vs seq[0:512]", even, exp_seq[:512])
    compare("HLS even vs seq[512:1024]", even, exp_seq[512:])
    compare("HLS even vs seq even", even, exp_seq[0::2])
    compare("HLS even vs seq odd", even, exp_seq[1::2])

    print()
    compare("HLS even vs dup[0:512]", even, exp_dup[:512])
    compare("HLS even vs dup[512:1024]", even, exp_dup[512:])
    compare("HLS even vs dup even", even, exp_dup[0::2])
    compare("HLS even vs dup odd", even, exp_dup[1::2])

    br_seq = bit_reverse_permute(exp_seq)
    br_dup = bit_reverse_permute(exp_dup)

    print()
    compare("Direct HLS vs bitrev NTT1024(seq input)", hls, br_seq)
    compare("Direct HLS vs bitrev NTT1024(dup input)", hls, br_dup)

    print()
    compare("HLS even vs bitrev seq[0:512]", even, br_seq[:512])
    compare("HLS even vs bitrev seq even", even, br_seq[0::2])
    compare("HLS even vs bitrev dup[0:512]", even, br_dup[:512])
    compare("HLS even vs bitrev dup even", even, br_dup[0::2])

if __name__ == "__main__":
    main()
