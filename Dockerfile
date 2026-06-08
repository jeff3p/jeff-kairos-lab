ARG BASE_IMAGE=quay.io/rockylinux/rockylinux:10
FROM quay.io/kairos/kairos-init:v0.14.4 AS kairos-init

FROM ${BASE_IMAGE} AS base-kairos
ARG VARIANT=core
ARG MODEL=generic
ARG TRUSTED_BOOT=false
ARG PROVIDER_NAME=k3s
#optionally specify provider version
ARG PROVIDER_VERSION=latest
ARG VERSION=1.00.00

COPY --from=kairos-init /kairos-init /kairos-init
RUN /kairos-init -l debug -s install -m "${MODEL}" -v "${VARIANT}" -t "${TRUSTED_BOOT}" --provider "${PROVIDER_NAME}" --provider-"${PROVIDER_NAME}"-version "${PROVIDER_VERSION}" --version "${VERSION}"
RUN /kairos-init -l debug -s init -m "${MODEL}" -v "${VARIANT}" -t "${TRUSTED_BOOT}" --provider "${PROVIDER_NAME}" --provider-"${PROVIDER_NAME}"-version "${PROVIDER_VERSION}" --version "${VERSION}"
RUN rm /kairos-init
