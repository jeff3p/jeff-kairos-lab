ARG BASE_IMAGE=quay.io/jfronius/kairos-opensuse:unpatched-ubuntu-base

FROM ${BASE_IMAGE} AS base-kairos

RUN apt-get update \
    && apt-get upgrade -y
