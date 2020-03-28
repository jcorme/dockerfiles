ARG IMAGE
FROM $IMAGE

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
      libgl1-mesa-dri \
      libgl1-mesa-glx \
      kmod \
  && rm -rf /var/lib/apt/lists/*

COPY driver.run /tmp/driver.run
RUN sh /tmp/driver.run -a --install-libglvnd --ui=none --no-kernel-module && rm /tmp/driver.run

CMD ["bash"]
