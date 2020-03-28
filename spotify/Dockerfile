FROM nvidia-ogl-debian:10-latest

RUN apt-get update \
  && apt-get install --no-install-recommends -y curl gnupg ca-certificates \
  && curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list \
  && apt-get update \
  && apt-get install --no-install-recommends -y \
      spotify-client \
      pulseaudio-utils \
      xdg-utils \
      dbus \
  && apt-get install -y fonts-noto \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /home/spotify
RUN useradd -m -d $HOME -r -u 700 -U spotify \
  && groupadd -g 995 -r arch-audio \
  && usermod -aG arch-audio spotify \
  && chown -R spotify:spotify $HOME 

COPY --chown=spotify:spotify pulse-client.conf /home/spotify/.config/pulse/client.conf

WORKDIR $HOME
USER spotify

ENTRYPOINT ["dbus-run-session", "spotify"]
