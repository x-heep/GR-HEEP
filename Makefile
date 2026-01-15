# Global configuration
ROOT_DIR		:= $(realpath .)
X_HEEP_DIR 		:= $(ROOT_DIR)/hw/vendor/x-heep
BUILD_DIR 		:= build
SW_BUILD_DIR	:= sw/build

FUSESOC_BUILD_DIR = $(shell find $(BUILD_DIR) -maxdepth 1 -type d -name 'x-heep_systems_gr-heep_*' 2>/dev/null | sort -V | head -n 1)
VERILATOR_DIR     = $(FUSESOC_BUILD_DIR)/sim-verilator
QUESTASIM_DIR     = $(FUSESOC_BUILD_DIR)/sim-modelsim

# FUSESOC and Python values (default)
ifndef CONDA_DEFAULT_ENV
$(info USING VENV)
FUSESOC = ./.venv/bin/fusesoc
PYTHON  = ./.venv/bin/python
else
$(info USING MINICONDA $(CONDA_DEFAULT_ENV))
FUSESOC := $(shell which fusesoc)
PYTHON  := $(shell which python)
endif

# Verilog format and linting variables
RTL_FILES := $(wildcard hw/gr-heep/*.sv)

# X-HEEP configuration
X_HEEP_CFG  		?= $(ROOT_DIR)/config/mcu-gen.hjson
PADS_CFG			?= $(ROOT_DIR)/config/gr-heep-pads.hjson
EXTERNAL_DOMAINS	:= 0 # TO BE UPDATED according to the number of external domains
GR_HEEP_CACHE 		:= $(BUILD_DIR)/gr-heep_cache.pickle
XHEEP_CONFIG_CACHE 	:= $(ROOT_DIR)/$(GR_HEEP_CACHE)
MCU_GEN_OPTS		:= --cached_path $(XHEEP_CONFIG_CACHE) --cached
MCU_GEN_LOCK		:= $(BUILD_DIR)/.mcu-gen.lock

# GR-HEEP configuration
GR_HEEP_GEN_CFG	 := config/gr-heep-cfg.hjson
GR_HEEP_GEN_OPTS := --cfg $(GR_HEEP_GEN_CFG)
GR_HEEP_GEN_LOCK := $(BUILD_DIR)/.gr-heep-gen.lock

# Software
PROJECT := hello_world

# Vendor
MODULE_NAME ?= x-heep

.PHONY: verible
verible:
	@for file in $(RTL_FILES); do \
		verible-verilog-format $$file --inplace \
			--formal_parameters_indentation indent --named_parameter_indentation indent \
			--named_port_indentation indent --port_declarations_indentation indent 2> /dev/null; \
		verible-verilog-lint $$file --lint_fatal=false --parse_fatal=false; \
	done

.PHONY: mcu-gen
mcu-gen: $(MCU_GEN_LOCK)
$(MCU_GEN_LOCK): $(X_HEEP_CFG) $(PADS_CFG)
	@echo "### Building X-HEEP MCU..."
	$(MAKE) -C $(X_HEEP_DIR) mcu-gen
	touch $@
	$(RM) $(GR_HEEP_GEN_LOCK)
	@echo "### DONE! X-HEEP MCU generated successfully"

.PHONY: gr-heep-gen-force
gr-heep-gen-force:
	$(RM) $(MCU_GEN_LOCK) $(GR_HEEP_GEN_LOCK)
	$(MAKE) gr-heep-gen

.PHONY: gr-heep-gen
gr-heep-gen: $(GR_HEEP_GEN_LOCK)
$(GR_HEEP_GEN_LOCK): $(GR_HEEP_GEN_CFG) $(MCU_GEN_LOCK)
	@echo "### Generating gr-HEEP..."
	$(PYTHON) $(X_HEEP_DIR)/util/mcu_gen.py $(MCU_GEN_OPTS) \
		--outtpl $(ROOT_DIR)/hw/gr-heep/gr_heep.sv.tpl
	$(PYTHON) $(X_HEEP_DIR)/util/mcu_gen.py $(MCU_GEN_OPTS) \
		--outtpl $(ROOT_DIR)/hw/gr-heep/gr_heep_pad_ring.sv.tpl
	$(PYTHON) $(X_HEEP_DIR)/util/mcu_gen.py $(MCU_GEN_OPTS) \
		--outtpl $(ROOT_DIR)/tb/tb_util.svh.tpl
	$(PYTHON) util/gr-heep-gen.py $(GR_HEEP_GEN_OPTS) \
		--outdir hw/gr-heep \
		--tpl-sv hw/gr-heep/gr_heep_pkg.sv.tpl \
		--corev_pulp $(COREV_PULP)
	$(PYTHON) util/gr-heep-gen.py $(GR_HEEP_GEN_OPTS) \
		--outdir hw/gr-heep \
		--tpl-sv hw/gr-heep/gr_heep_peripherals.sv.tpl
	$(PYTHON) util/gr-heep-gen.py $(GR_HEEP_GEN_OPTS) \
		--outdir sw/external/lib/runtime \
		--tpl-c sw/external/lib/runtime/gr_heep.h.tpl
	$(MAKE) verible
	@echo "### DONE! gr-HEEP generated successfully"
	touch $@

## Verilator simulation with C++
.PHONY: verilator-build
verilator-build:
	$(FUSESOC) --cores-root . run --no-export --target=sim --tool=verilator $(FUSESOC_FLAGS) \
		--build x-heep:systems:gr-heep $(FUSESOC_PARAM) 2>&1 | tee buildsim.log

## First builds the app and then uses Verilator to simulate the HW model and run the FW
.PHONY: verilator-run-app
verilator-run-app:
	$(MAKE) -C $(X_HEEP_DIR) app
	$(FUSESOC) --cores-root . run --no-export --target=sim --tool=verilator $(FUSESOC_FLAGS) \
		--run x-heep:systems:gr-heep $(FUSESOC_PARAM) \
		--run_options="+firmware=../../../sw/build/main.hex $(SIM_ARGS)"

## Launches the RTL simulation with the compiled firmware (`app` target) using
## the C++ Verilator model previously built (`verilator-build` target).
.PHONY: verilator-run
verilator-run:
	$(FUSESOC) --cores-root . run --no-export --target=sim --tool=verilator $(FUSESOC_FLAGS) \
		--run x-heep:systems:gr-heep $(FUSESOC_PARAM) \
		--run_options="+firmware=../../../sw/build/main.hex $(SIM_ARGS)"

## Questasim simulation
.PHONY: questasim-build
questasim-build:
	$(FUSESOC) --cores-root . run --no-export --target=sim --tool=modelsim $(FUSESOC_FLAGS) \
		--build x-heep:systems:gr-heep $(FUSESOC_PARAM) 2>&1 | tee buildsim.log

## Questasim simulation with HDL optimized compilation
.PHONY: questasim-build-opt
questasim-build-opt: questasim-build
	$(MAKE) -C $(QUESTASIM_DIR) opt

## First builds the app and then uses Questasim to simulate the HW model and run the FW
.PHONY: questasim-run-app
questasim-run-app:
	$(MAKE) -C $(X_HEEP_DIR) app
	$(MAKE) -C $(QUESTASIM_DIR) run RUN_OPT=1 PLUSARGS="c firmware=../../../sw/build/main.hex"
	@echo -e "\033[1m### DONE! Simulation finished. UART output:\033[0m"
	@cat $(QUESTASIM_DIR)/uart0.log

.PHONY: questasim-run-app-gui
questasim-run-app-gui:
	$(MAKE) -C $(X_HEEP_DIR) app
	$(MAKE) -C $(QUESTASIM_DIR) run-gui RUN_OPT=1 PLUSARGS="c firmware=../../../sw/build/main.hex"
	@echo -e "\033[1m### DONE! Simulation finished. UART output:\033[0m"
	@cat $(QUESTASIM_DIR)/uart0.log

## @section Utilities

## Update vendor submodules
## @note These targets are used to update the vendored submodules.
## @param MODULE_NAME=module_name The name of the submodule to update when using vendor-update.
.PHONY: vendor-update
vendor-update:
	@echo "Updating vendored module '$(MODULE_NAME)'..."
	$(PYTHON) util/vendor.py hw/vendor/$(MODULE_NAME).vendor.hjson -Uv

.PHONY: vendor-update-all
vendor-update-all:
	@echo "Updating all vendored modules..."
	find hw/vendor -maxdepth 1 -type f -name "*.vendor.hjson" -exec ./util/vendor.py -vU {} \;

# Export variables
export HEEP_DIR = $(X_HEEP_DIR)
export X_HEEP_CFG
export PADS_CFG
export EXTERNAL_DOMAINS
export XHEEP_CONFIG_CACHE
export PROJECT

# Include X-HEEP targets
XHEEP_MAKE = $(HEEP_DIR)/external.mk
ifneq ("$(wildcard $(XHEEP_MAKE))","")
	include $(XHEEP_MAKE)
endif
