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
RUN useradd -m -d $HOME -u 4000 -U spotify \
  && mkdir $HOME/.cache $HOME/.config \
  && chown -R spotify:spotify $HOME 

WORKDIR $HOME
USER spotify

ENTRYPOINT ["spotify"]
