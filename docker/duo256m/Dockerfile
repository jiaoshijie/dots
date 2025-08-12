FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

COPY ./change_apt_mirror /root/change_apt_mirror

RUN chmod +x ./change_apt_mirror && ./change_apt_mirror

RUN apt update && \
    apt install -y --no-install-recommends \
    pkg-config build-essential ninja-build automake autoconf libtool wget \
    curl git gcc libssl-dev bc slib squashfs-tools \
    android-sdk-libsparse-utils jq python3-distutils scons parallel tree \
    python3-dev python3-pip device-tree-compiler ssh cpio fakeroot \
    libncurses5 flex bison libncurses5-dev genext2fs rsync unzip dosfstools \
    mtools tcl openssh-client cmake expect python-is-python3 vim-common

RUN pip install --no-cache-dir jinja2 -i https://pypi.tuna.tsinghua.edu.cn/simple

# clean
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
