#!/usr/bin/env python3
from pathlib import Path
import re
import sys

Q = 12289
N = 1024

ROOT = Path(__file__).resolve().parents[1]
UART_LOG = ROOT / "build/x-heep_systems_gr-heep_0/sim-verilator/uart0.log"

sys.path.insert(0, str(ROOT / "scripts"))
import check_polymul_pipeline as ref

def main():
    text = UART_LOG.read_text()

    m = re.search(r"^VKC\s+(\d+)", text, re.MULTILINE)
    if not m:
        raise SystemExit("No encontré VKC en uart0.log")

    hw_vkc = int(m.group(1))

    # Mismos patrones que main.c.
    s2 = [((2 * i) + 5) % Q for i in range(N)]
    h  = [((3 * i) + 7) % Q for i in range(N)]
    c  = [((11 * i) + 13) % Q for i in range(N)]

    gmb = ref.load_dat(ref.GMB_DAT)
    igmb = ref.load_dat(ref.IGMB_DAT)

    ns2 = ref.ntt_ref(s2, gmb)
    nh  = ref.ntt_ref(h, gmb)

    p = [ref.mq_montymul(a, b) for a, b in zip(ns2, nh)]
    s2h = ref.intt_ref(p, igmb)

    s1 = [ref.mq_sub(ci, mi) for ci, mi in zip(c, s2h)]

    golden_vkc = 0
    for v in s1:
        golden_vkc ^= (v & 0xFFFF)

    print(f"HW VKC:     {hw_vkc}")
    print(f"Golden VKC: {golden_vkc}")

    if hw_vkc == golden_vkc:
        print("VERIFY KERNEL checksum: OK")
        return 0

    # Diagnóstico por si hubiera convención residual +4095 en s2h.
    s1_shift = [ref.mq_sub(ci, (mi + 4095) % Q) for ci, mi in zip(c, s2h)]
    shift_chk = 0
    for v in s1_shift:
        shift_chk ^= (v & 0xFFFF)

    print(f"Golden with s2h+4095 VKC: {shift_chk}")
    print("VERIFY KERNEL checksum: FAILED")
    return 1

if __name__ == "__main__":
    sys.exit(main())
