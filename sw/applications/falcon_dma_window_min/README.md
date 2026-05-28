# Falcon DMA window minimal test

This temporary application validates that `FALCON_ACCELERATOR_START_ADDRESS`
reaches the `falcon_accelerator.sv` OBI interface.

Current diagnostic RTL stores any OBI write into a scalar register
`obi_word0_q` and reads it back through the same OBI window.

Validated result:

- `Program Finished with value 0`

Meaning:

- CPU writes to `FALCON_ACCELERATOR_START_ADDRESS`
- Transaction reaches `falcon_accelerator.sv` through OBI
- Scalar OBI readback works

This is not the final DMA implementation. The next step is to replace the
diagnostic scalar register with a clean OBI data-window memory module, e.g.
`falcon_obi_data_window.sv`, suitable for DMA block transfers.
