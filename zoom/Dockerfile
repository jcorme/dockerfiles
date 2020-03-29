FROM nvidia-ogl-debian:10-latest

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    curl \
    ca-certificates \
    libnss3 \
    pulseaudio-utils \
    xdg-utils \
    chromium \
    chromium-l10n \
  && curl -L https://zoom.us/client/latest/zoom_amd64.deb -o /tmp/zoom_amd64.deb \
  && apt-get install -y \
    /tmp/zoom_amd64.deb \
    fonts-noto \
  && rm /tmp/zoom_amd64.deb \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /home/zoom
RUN useradd -m -d $HOME -u 4000 -U zoom \
  && mkdir $HOME/.cache $HOME/.config \
  && chown -R zoom:zoom $HOME 

WORKDIR $HOME
USER zoom

ENTRYPOINT ["zoom"]
