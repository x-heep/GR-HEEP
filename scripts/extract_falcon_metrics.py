#!/usr/bin/env python3
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
UART_LOG = ROOT / "build/x-heep_systems_gr-heep_0/sim-verilator/uart0.log"

METRIC_KEYS = [
    "POINTWISE_MUL1024_EXEC_CYCLES",
    "POINTWISE_MUL1024_LOAD_CYCLES",
    "POINTWISE_MUL1024_READ_CYCLES",
    "POINTWISE_MUL1024_TOTAL_CORE_CYCLES",
    "POINTWISE_MUL1024_TOTAL_MEASURED_CYCLES",
    "POINTWISE_MUL1024_CHECKSUM",

    "HLS_NTT1024_LOAD_CYCLES",
    "HLS_NTT1024_EXEC_CYCLES",
    "HLS_NTT1024_READ_CYCLES",
    "HLS_NTT1024_TOTAL_CORE_CYCLES",
    "HLS_NTT1024_TOTAL_MEASURED_CYCLES",
    "HLS_NTT1024_CHECKSUM",

    "INTT_EXEC",
    "INTT_CORR",
    "RT_D",
    "RT_C",
    "RT_H",
]

STATUS_KEYS = [
    "Dummy OK",
    "NTT16 OK",
    "PW16 OK",
    "PW1024 OK",
    "INTT OK",
    "RT OK",
    "PM OK",
    "VKOK",
    "Program Finished with value 0",
]

def find_metric(text: str, key: str):
    m = re.search(rf"^{re.escape(key)}\s+([0-9]+)", text, re.MULTILINE)
    return int(m.group(1)) if m else None

def main():
    if not UART_LOG.exists():
        raise SystemExit(f"No existe {UART_LOG}")

    text = UART_LOG.read_text(errors="replace")
    metrics = {}

    for key in METRIC_KEYS:
        metrics[key] = find_metric(text, key)

    # PIP <NTT_A> <NTT_B> <POINTWISE_MONTY> <INTT> <TOTAL>
    pip = re.search(r"^PIP\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)", text, re.MULTILINE)
    if pip:
        pipe_ntta = int(pip.group(1))
        pipe_nttb = int(pip.group(2))
        pipe_pw = int(pip.group(3))
        pipe_intt = int(pip.group(4))
        pipe_total = int(pip.group(5))
        pipe_compute = pipe_ntta + pipe_nttb + pipe_pw + pipe_intt
        pipe_overhead = pipe_total - pipe_compute

        metrics["PIPE_NTTA_CYCLES"] = pipe_ntta
        metrics["PIPE_NTTB_CYCLES"] = pipe_nttb
        metrics["PIPE_POINTWISE_MONTY_CYCLES"] = pipe_pw
        metrics["PIPE_INTT_CYCLES"] = pipe_intt
        metrics["PIPE_TOTAL_CYCLES"] = pipe_total
        metrics["PIPE_ACCEL_COMPUTE_CYCLES"] = pipe_compute
        metrics["PIPE_DATA_MOVEMENT_OVERHEAD_CYCLES"] = pipe_overhead

    pc = re.search(r"^PC\s+(\d+)\s+(\d+)", text, re.MULTILINE)
    if pc:
        metrics["PIPE_CHECKSUM_DIRECT"] = int(pc.group(1))
        metrics["PIPE_CHECKSUM_CORRECTED_MINUS_4095"] = int(pc.group(2))

    # VKP <NTT_s2> <NTT_h> <POINTWISE_MONTY> <INTT> <POLY_SUB1024> <TOTAL>
    vkp = re.search(r"^VKP\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)", text, re.MULTILINE)
    if vkp:
        verify_ntt_s2 = int(vkp.group(1))
        verify_ntt_h = int(vkp.group(2))
        verify_pw = int(vkp.group(3))
        verify_intt = int(vkp.group(4))
        verify_sub = int(vkp.group(5))
        verify_total = int(vkp.group(6))
        verify_compute = verify_ntt_s2 + verify_ntt_h + verify_pw + verify_intt + verify_sub
        verify_overhead = verify_total - verify_compute

        metrics["VERIFY_NTT_S2_CYCLES"] = verify_ntt_s2
        metrics["VERIFY_NTT_H_CYCLES"] = verify_ntt_h
        metrics["VERIFY_POINTWISE_MONTY_CYCLES"] = verify_pw
        metrics["VERIFY_INTT_CYCLES"] = verify_intt
        metrics["VERIFY_POLY_SUB1024_CYCLES"] = verify_sub
        metrics["VERIFY_TOTAL_CYCLES"] = verify_total
        metrics["VERIFY_ACCEL_COMPUTE_CYCLES"] = verify_compute
        metrics["VERIFY_DATA_MOVEMENT_OVERHEAD_CYCLES"] = verify_overhead

    vkc = re.search(r"^VKC\s+(\d+)", text, re.MULTILINE)
    if vkc:
        metrics["VERIFY_CHECKSUM"] = int(vkc.group(1))

    print("## Falcon accelerator metrics")
    print()
    print("| Metric | Value |")
    print("|---|---:|")

    for key, value in metrics.items():
        shown = "-" if value is None else value
        print(f"| `{key}` | {shown} |")

    print()
    print("## Status")
    for key in STATUS_KEYS:
        status = "OK" if key in text else "-"
        print(f"- {key}: {status}")

if __name__ == "__main__":
    main()
