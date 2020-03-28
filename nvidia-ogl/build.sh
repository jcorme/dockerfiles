#!/bin/bash

set -e

vers=$(cat /proc/driver/nvidia/version | head -n 1 | awk '{print $8}')

if [[ ! -f .driver-version || $(< .driver-version) != "$vers" || ! -f driver.run ]]; then
  curl -v http://us.download.nvidia.com/XFree86/Linux-x86_64/${vers}/NVIDIA-Linux-x86_64-${vers}.run -o driver.run
  echo -n "$vers" > .driver-version
fi

# sudo needed since I don't add my users to docker group
sudo docker build --build-arg IMAGE="debian:buster-slim" -t nvidia-ogl-debian:10-${vers} .
sudo docker tag nvidia-ogl-debian:10-${vers} nvidia-ogl-debian:10-latest
sudo docker tag nvidia-ogl-debian:10-${vers} nvidia-ogl-debian:latest
