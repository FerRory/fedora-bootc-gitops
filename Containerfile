FROM quay.io/fedora/fedora-bootc:latest

#include unit files and containers
ADD etc etc

#add additional software
RUN dnf install -y cockpit cockpit-podman cockpit-storaged cockpit-ws git lm_sensors sysstat tuned vim-enhanced bash-completion && dnf clean all

#enable desired units
RUN systemctl enable lm_sensors sysstat tuned fstrim.timer podman.socket podman-auto-update.timer cockpit.socket

RUN ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

RUN bootc container lint
