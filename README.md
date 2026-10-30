# GR-HEEP

GR-HEEP (General Repository for X-HEEP) is a template repository for building your own SoC on top of [X-HEEP](https://github.com/x-heep/x-heep), the eXtensible Heterogeneous Energy-Efficient Platform. If you're not yet familiar with X-HEEP, go check it out first!

It shows the recommended way to extend X-HEEP: instead of forking X-HEEP, create a top-level repository that **vendors X-HEEP as an immutable dependency** and adds your own hardware, software, and configuration around it. This keeps your project updatable while everything you own lives outside the vendored tree.

X-HEEP lives in `hw/vendor/x-heep/`, pinned to an exact commit by `hw/vendor/x-heep.vendor.hjson` and managed with the [vendor tool](https://opentitan.org/book/util/doc/vendor.html) (`util/vendor.py`). You never modify the vendored code, fixes go upstream or into patches.

On top of it, GR-HEEP adds:

| Directory | Purpose |
|---|---|
| `config/` | The SoC configuration: `mcu-gen-config.py` (CPU, memory, peripherals, interrupts, external slaves) and `gr-heep_pad_cfg.py` (pad ring). |
| `hw/gr-heep/` | GR-HEEP's own RTL wrapper around X-HEEP: bus fabric, crossbar, pad ring, and peripheral subsystem. |
| `hw/fpga_ext/`, `hw/fpga/` | FPGA wrapper and board support (Pynq-Z2, Nexys A7-100T, Genesys2, AU+ zu3, ZCU102/104). |
| `gr-heep.core` | The [FuseSoC](https://fusesoc.readthedocs.io/) core (`x-heep:systems:gr-heep`) that ties everything together for targets like simulation or synthesis. |
| `sw/` | Applications (`sw/applications/`), drivers, SDK, and linker scripts for the extended SoC. |
| `sw/external/` | GR-HEEP-specific SW runtime (e.g. `ext_irq.c` PLIC handlers and the generated `gr_heep.h`), compiled together with X-HEEP's `sw` tree. |
| `tb/`, `test/` | Testbench and the app compile-and-simulate test suite. |
| `.github/workflows/` | CI, including the nightly canary that keeps X-HEEP updated. |

The root `Makefile` forwards any target it does not define to X-HEEP's own Makefile, so all the standard X-HEEP commands work from the repository root.

## Using this repository as a template

1. Fork the repository.
2. Change the name to your project.
3. (optional) Update the references to GR-HEEP to your project name.
4. Start shaping your SoC by adding your IPs in `hw/` and configuring the system in `config/mcu-gen-config.py`.

## Adding your own hardware

- Keep your IP in its own repository and vendor it the same way X-HEEP is: add a `hw/vendor/<your_ip>.vendor.hjson` pinning the upstream URL and revision, run `make vendor-update MODULE_NAME=<your_ip>`, and depend on its FuseSoC core from the relevant fileset in `gr-heep.core` (`depend:` entry). This keeps your accelerator versioned and updatable independently of the SoC. For quick experiments, plain RTL under `hw/` listed in the `files_rtl_generic` fileset of `gr-heep.core` also works.
- Wire new external slaves and peripherals into the SoC in `gr_heep_config()` in `config/mcu-gen-config.py`: add them to the address map and assign their interrupts there.
- If your module needs generated code, provide it as a `*.tpl` template anywhere in the tree. `make mcu-gen` discovers and expands it automatically.
- Give your hardware a driver or runtime code under `sw/external`, next to the existing GR-HEEP code, and write your applications in `sw/applications`.

## Getting started

Follow the [X-HEEP setup guide](https://x-heep.readthedocs.io/en/latest/GettingStarted/Setup.html) to install the Python environment and the RISC-V toolchain (a ready-made Docker image is also available). Then, from the repository root:

```bash
make mcu-gen              # generate the RTL and SW headers from config/
make app PROJECT=gr_heep_hello_world   # build the firmware -> sw/build/main.hex
make verilator-build      # build the Verilator simulation model
make verilator-run        # run the app on the simulated HW

make vivado-fpga FPGA_BOARD=pynq-z2   # build an FPGA bitstream
```

Run `make help` for the full list of targets.

You can find the documentation in the X-HEEP repository: <https://x-heep.readthedocs.io/en/latest/>
