# Copyright 2026 EPFL
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Author(s): David Mallasen
# Description: GR-HEEP test using its applications

"""
FUTURE WORK:
- The current setup only uses the on_chip linker.
- The current setup only allows for the compilation with one compiler for 
    each application.
"""

import sys
import os
import argparse

# Reuse the functions from X-HEEP's test_apps
current_dir = os.path.dirname(os.path.abspath(__file__))
vendor_base_dir = os.path.abspath(
    os.path.join(current_dir, "..", "hw", "vendor", "x-heep", "test")
)
vendor_pkg_dir = os.path.join(vendor_base_dir, "test_apps")
sys.path.insert(0, vendor_base_dir)
sys.path.insert(0, vendor_pkg_dir)

from simulator import Simulator, SimResult
from bcolors import BColors
from utils import get_apps, in_list, filter_results, print_results

# Available compilers
COMPILERS = ["gcc"]
COMPILER_PATH = [os.environ.get("RISCV_XHEEP") for _ in COMPILERS]
COMPILER_PREFIXES = ["riscv32-unknown-" for _ in COMPILERS]

# Available simulators
SIMULATORS = ["verilator"]

# Pattern to look for when simulating an app to see if the app finished
# correctly or not
ERROR_PATTERN_DICT = {
    "verilator": r"Program Finished with value (\d+)",
}

# Timeout for the simulation in seconds
SIM_TIMEOUT_S = 180

# Whitelist of apps. Has priority over the blacklist.
# Useful if you only want to test certain apps
WHITELIST_XHEEP = [
    "example_asm",
    "example_cpp",
    "example_data_processing_from_flash",
    "example_dma_multichannel",
    "example_dma_sdk",
    "example_dma_2d",
    "example_fft",
    "example_gpio_toggle",
    "example_matadd",
    "example_matadd_interleaved",
    "example_matfloat",
    "example_minimal",
    "example_spidma_powergate",
    "example_tensor_format_conv",
    "example_timer_sdk",
    "example_xheep_config",
    "hello_world",
]
WHITELIST = []

# Blacklist of apps to skip
BLACKLIST_XHEEP = []
BLACKLIST = []

# Blacklist of apps to skip with verilator
VERILATOR_BLACKLIST = []


def main():
    parser = argparse.ArgumentParser(description="Test script")
    parser.add_argument(
        "--compile-only", action="store_true", help="Only compile the applications"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print the commands that would be run without executing them",
    )
    args = parser.parse_args()

    # Get the compilers to use
    compilers = COMPILERS
    compiler_paths = COMPILER_PATH
    compiler_prefixes = COMPILER_PREFIXES

    # Get a list with all the applications we want to test
    xheep_app_list = get_apps(
        "hw/vendor/x-heep/sw/applications", WHITELIST_XHEEP, BLACKLIST_XHEEP
    )
    gr_heep_app_list = get_apps("sw/applications", WHITELIST, BLACKLIST)
    app_list = xheep_app_list + gr_heep_app_list

    # Get the simulators to use
    simulators = []
    for simulator_name in SIMULATORS:
        error_pattern = ERROR_PATTERN_DICT.get(simulator_name)
        if error_pattern is None:
            print(
                BColors.FAIL
                + f"Error: No error pattern defined for simulator {simulator_name}."
                + BColors.ENDC
            )
            exit(1)
        simulators.append(Simulator(simulator_name, error_pattern))

    if not args.compile_only:
        for simulator in simulators:
            simulator.build(dry_run=args.dry_run)

    # Compile every app and run with the simulators
    for an_app in app_list:
        if in_list(an_app.name, BLACKLIST):
            print(
                BColors.WARNING + f"Skipping {an_app.name}..." + BColors.ENDC,
                flush=True,
            )
        else:
            # Compile the app with every compiler, leaving gcc for last
            #   so the simulation is done with gcc
            for compiler_path, compiler_prefix, compiler in zip(
                compiler_paths, compiler_prefixes, compilers
            ):
                compilation_result = an_app.compile(
                    compiler_path,
                    compiler_prefix,
                    compiler,
                    "on_chip",
                    None,
                    dry_run=args.dry_run,
                )
                an_app.set_compilation_status(compiler, compilation_result)

            # Run the app with every simulator if the compilation was successful
            if not args.compile_only and an_app.compilation_succeeded():
                for simulator in simulators:
                    # Only run the app with verilator if it is not in the verilator_blacklist
                    if simulator.name == "verilator" and in_list(
                        an_app.name, VERILATOR_BLACKLIST
                    ):
                        an_app.add_simulation_result(simulator.name, SimResult.SKIPPED)
                        print(
                            BColors.WARNING
                            + f"Skipping running {an_app.name} with verilator..."
                            + BColors.ENDC,
                            flush=True,
                        )
                    else:
                        simulation_result = simulator.run_app(
                            an_app, SIM_TIMEOUT_S, dry_run=args.dry_run
                        )
                        an_app.add_simulation_result(simulator.name, simulation_result)

    # Filter and print the results
    (
        skipped_apps,
        ok_apps,
        compilation_failed_apps,
        simulation_failed_apps,
        simulation_timed_out_apps,
    ) = filter_results(app_list, BLACKLIST)
    print_results(
        app_list,
        skipped_apps,
        ok_apps,
        compilation_failed_apps,
        simulation_failed_apps,
        simulation_timed_out_apps,
    )

    # Exit with error if any app failed to compile or run
    if len(compilation_failed_apps) > 0 or len(simulation_failed_apps) > 0:
        exit(1)


if __name__ == "__main__":
    main()
