FROM ubuntu:rolling
ARG TARGETPLATFORM

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    net-tools \
    docker.io \
    build-essential \
    apt-utils \
    vim \
    nano \
    mtr \
    traceroute \
    iputils-ping \
    groff \
    apache2-utils \
    ncat \
    wget \
    socat \
    dnsutils \
    htop \
    iptables \
    python3-pip \
    tcpdump \
    tshark \
    ssh \
    kafkacat \
    unzip && \
    rm -rf /var/lib/apt/lists/*

ADD get_binaries.sh /root
RUN /usr/bin/bash -x /root/get_binaries.sh
