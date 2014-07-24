TEMPLATE_PATHS := $(wildcard templates/*/*.json)
TEMPLATE_FILENAMES := $(notdir ${TEMPLATE_PATHS})
TEMPLATE_DIRS := $(wildcard templates/*/)
BOX_FILENAMES := $(TEMPLATE_FILENAMES:.json=.box)
BOX_FILES := $(foreach box_filename, $(BOX_FILENAMES), $(box_filename))

vpath %.json templates/fedora templates/centos templates/scientific

%.box: %.json
	cd $(dir $<); \
	mkdir -p ../../output; \
	export PACKER_CACHE_DIR='../../packer_cache'; \
	echo $(notdir $<); \
	packer validate -var 'version=$(version)' $(notdir $<); \
	packer build -var 'version=$(version)' $(notdir $<)

.PHONY: all
all: $(BOX_FILES)

.PHONY: list
list:
	@for box_filename in $(BOX_FILENAMES); do \
		echo $$box_filename; \
	done

.PHONY: clean
clean:
	rm -rf ./output
	rm -rf ./packer_cache
	rm -rf ./packer_output
