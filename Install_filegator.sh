#!/bin/bash

sudo apt-get update

sudo docker run -d \
  --name=filegator \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Colombo \
  -p 80:80 \
  -p 443:443 \
  -v /home/ubuntu/docker/filegator/config:/config \
  -v /home/ubuntu/docker/qBittorrent/downloads:/data \
  --restart unless-stopped \
  maxime1907/filegator
