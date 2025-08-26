#!/bin/bash


podman \
run \
--rm \
--name \
fedora-bootc-gitops-bootc-image-builder \
--tty \
--privileged \
--security-opt \
label=type:unconfined_t \
-v \
/Users/roryschellekens/workspace/fedora-bootc-gitops/output:/output/ \
-v \
/var/lib/containers/storage:/var/lib/containers/storage \
-v \
/Users/roryschellekens/workspace/fedora-bootc-gitops/config.toml:/config.toml:ro \
--label \
bootc.image.builder=true \
quay.io/centos-bootc/bootc-image-builder:latest \
ghcr.io/ferrory/fedora-bootc-gitops:latest \
--output \
/output/ \
--local \
--progress \
verbose \
--type \
anaconda-iso \
--target-arch \
arm64 \
--rootfs \
xfs
