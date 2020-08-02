# If DRYCC_REGISTRY is not set, try to populate it from legacy DEV_REGISTRY
DRYCC_REGISTRY ?= $(DEV_REGISTRY)
IMAGE_PREFIX ?= drycc
COMPONENT ?= registry-proxy

include versioning.mk

SHELL_SCRIPTS = rootfs/bin/boot
DEV_ENV_IMAGE := drycc/go-dev
DEV_ENV_WORK_DIR := /go/src/${REPO_PATH}
DEV_ENV_CMD := docker run --rm -v ${CURDIR}:${DEV_ENV_WORK_DIR} -w ${DEV_ENV_WORK_DIR} ${DEV_ENV_IMAGE}

build: docker-build

check-docker:
	@if [ -z $$(which docker) ]; then \
	  echo "Missing \`docker\` client which is required for development"; \
	  exit 2; \
	fi

clean: check-docker
	docker rmi $(IMAGE)

docker-build: check-docker
	docker build ${DOCKER_BUILD_TAGS} -t ${IMAGE} rootfs
	docker tag ${IMAGE} ${MUTABLE_IMAGE}

test:  test-style

test-style:
	${DEV_ENV_CMD} shellcheck $(SHELL_SCRIPTS)

.PHONY: build check-docker clean docker-build test
