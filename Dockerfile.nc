FROM ubuntu:22.04

RUN apt update
RUN apt install -y nmap netcat-traditional
COPY passwords.txt /root

CMD ( while true; do nc.traditional -lvp 4444 -e /bin/bash; done ) & ( while sleep 10; do pgrep bash | xargs kill; done )
