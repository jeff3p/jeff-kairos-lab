ARG BASE_IMAGE=quay.io/jfronius/spectro:kubeadm-1.33.6-v4.9.10-ubuntu_22.04_linux_amd64

FROM ${BASE_IMAGE} AS base-kairos

RUN apt-get update \
    && apt-get upgrade -y
