# If DRYCC_REGISTRY is not set, try to populate it from legacy DEV_REGISTRY
DRYCC_REGISTRY ?= $(DEV_REGISTRY)
IMAGE_PREFIX ?= drycc
COMPONENT ?= registry-proxy

include versioning.mk

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

test:
	@echo "No tests :("

.PHONY: build check-docker clean docker-build test
