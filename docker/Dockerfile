FROM ubuntu:24.04

LABEL maintainer="Ihor Dyrman"

RUN apt update && apt install -y net-tools iputils-ping

# Unprivileged user
RUN groupadd -r ihor && useradd -r -g ihor ihor

# Disable root login
RUN chsh -s /usr/sbin/nonologin root

ENV HOME=/home/ihor
ENV DEBIAN_FRONTEND=noninteractive