#!/usr/bin/env python3
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
LOG = ROOT / "build/x-heep_systems_gr-heep_0/sim-verilator/uart0.log"

patterns = {
    "POINTWISE_MUL1024_EXEC_CYCLES": r"POINTWISE_MUL1024_EXEC_CYCLES\s+(\d+)",
    "POINTWISE_MUL1024_LOAD_CYCLES": r"POINTWISE_MUL1024_LOAD_CYCLES\s+(\d+)",
    "POINTWISE_MUL1024_READ_CYCLES": r"POINTWISE_MUL1024_READ_CYCLES\s+(\d+)",
    "POINTWISE_MUL1024_TOTAL_CORE_CYCLES": r"POINTWISE_MUL1024_TOTAL_CORE_CYCLES\s+(\d+)",
    "POINTWISE_MUL1024_TOTAL_MEASURED_CYCLES": r"POINTWISE_MUL1024_TOTAL_MEASURED_CYCLES\s+(\d+)",
    "POINTWISE_MUL1024_CHECKSUM": r"POINTWISE_MUL1024_CHECKSUM\s+(\d+)",

    "HLS_NTT1024_LOAD_CYCLES": r"HLS_NTT1024_LOAD_CYCLES\s+(\d+)",
    "HLS_NTT1024_EXEC_CYCLES": r"HLS_NTT1024_EXEC_CYCLES\s+(\d+)",
    "HLS_NTT1024_READ_CYCLES": r"HLS_NTT1024_READ_CYCLES\s+(\d+)",
    "HLS_NTT1024_TOTAL_CORE_CYCLES": r"HLS_NTT1024_TOTAL_CORE_CYCLES\s+(\d+)",
    "HLS_NTT1024_TOTAL_MEASURED_CYCLES": r"HLS_NTT1024_TOTAL_MEASURED_CYCLES\s+(\d+)",
    "HLS_NTT1024_CHECKSUM": r"HLS_NTT1024_CHECKSUM\s+(\d+)",

    "INTT_EXEC": r"INTT_EXEC\s+(\d+)",
    "INTT_CORR": r"INTT_CORR\s+(\d+)",

    "RT_D": r"RT_D\s+(\d+)",
    "RT_C": r"RT_C\s+(\d+)",
    "RT_H": r"RT_H\s+(\d+)",
    "PM_ERR": r"PM_ERR\s+(\d+)",
}

def find_value(text, pattern):
    m = re.search(pattern, text)
    return m.group(1) if m else "-"

def main():
    text = LOG.read_text(errors="replace")

    print("## Falcon accelerator metrics")
    print()
    print("| Metric | Value |")
    print("|---|---:|")
    for name, pat in patterns.items():
        print(f"| `{name}` | {find_value(text, pat)} |")

    print()
    print("## Status")
    for marker in ["Dummy OK", "NTT16 OK", "PW16 OK", "PW1024 OK", "INTT OK", "RT OK", "PM OK", "Program Finished with value 0"]:
        status = "OK" if marker in text else "-"
        print(f"- {marker}: {status}")

if __name__ == "__main__":
    main()
