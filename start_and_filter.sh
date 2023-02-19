#!/bin/bash
docker-compose up -d
docker-compose exec wireguard iptables -I FORWARD -d 10.1.1.1 -j DROP
docker-compose logs
