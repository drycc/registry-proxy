# If DRYCC_REGISTRY is not set, try to populate it from legacy DEV_REGISTRY
DRYCC_REGISTRY ?= $(DEV_REGISTRY)
IMAGE_PREFIX ?= drycc
COMPONENT ?= registry-proxy
DRYCC_REGISTRY ?= ${DEV_REGISTRY}
PLATFORM ?= linux/amd64,linux/arm64

include versioning.mk

SHELL_SCRIPTS = rootfs/bin/boot
DEV_ENV_IMAGE := ${DEV_REGISTRY}/drycc/go-dev
DEV_ENV_WORK_DIR := /opt/drycc/go/src/${REPO_PATH}
DEV_ENV_CMD := podman run --rm -v ${CURDIR}:${DEV_ENV_WORK_DIR} -w ${DEV_ENV_WORK_DIR} ${DEV_ENV_IMAGE}

build: podman-build

check-podman:
	@if [ -z $$(which podman) ]; then \
	  echo "Missing \`podman\` client which is required for development"; \
	  exit 2; \
	fi

clean: check-podman
	podman rmi $(IMAGE)

podman-build: check-podman
	podman build --build-arg CODENAME=${CODENAME} -t ${IMAGE} rootfs
	podman tag ${IMAGE} ${MUTABLE_IMAGE}

test:  test-style

test-style:
	${DEV_ENV_CMD} shellcheck $(SHELL_SCRIPTS)

.PHONY: build check-podman clean podman-build test
