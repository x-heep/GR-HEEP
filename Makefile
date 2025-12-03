# ----- CONFIGURATION ----- #

# Global configuration
ROOT_DIR		:= $(realpath .)
X_HEEP_DIR 		:= $(ROOT_DIR)/hw/vendor/x-heep
BUILD_DIR 		:= build
SW_BUILD_DIR	:= sw/build

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
		--outtpl $(ROOT_DIR)/hw/gr-heep/gr_heep_top.sv.tpl
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
	@echo "### DONE! gr-HEEP files generated successfully"
	touch $@

# Export variables
export HEEP_DIR = $(X_HEEP_DIR)
export X_HEEP_CFG
export PADS_CFG
export EXTERNAL_DOMAINS
export XHEEP_CONFIG_CACHE

# Include X-HEEP targets
XHEEP_MAKE = $(HEEP_DIR)/external.mk
ifneq ("$(wildcard $(XHEEP_MAKE))","")
	include $(XHEEP_MAKE)
endif
