FROM alpine:latest

RUN apk add --no-cache \
      s6 \
      xmlrpc-c \
      xmlrpc-c-dev \
      libcurl \
      ncurses-libs \
      zlib \
      libssl1.1 \
      xmlrpc-c \
      nghttp2-libs \
      openssl \
  && apk add --no-cache --virtual build-deps \
      curl \
      curl-dev \
      automake \
      autoconf \
      zlib-dev \
      libtool \
      g++ \
      openssl-dev \
      make \
      ncurses-dev \
  && apk add --no-cache --repository \
      http://dl-3.alpinelinux.org/alpine/v3.6/main/ cppunit-dev=1.13.2-r1 \
  && mkdir /build \
  && cd /build \
  && curl "http://rtorrent.net/downloads/libtorrent-0.13.6.tar.gz" -o "libtorrent-0.13.6.tar.gz" \
  && curl "http://rtorrent.net/downloads/rtorrent-0.9.6.tar.gz" -o "rtorrent-0.9.6.tar.gz" \
  && tar xzf libtorrent-0.13.6.tar.gz \
  && tar xzf rtorrent-0.9.6.tar.gz \
  && cd libtorrent-0.13.6 \
  && mkdir .prefix \
  && curl -L https://github.com/rakshasa/libtorrent/commit/4607bbf7.patch -o 4607bbf7.patch \
  && patch -p1 < 4607bbf7.patch \
  && ./autogen.sh \
  && ./configure --prefix=/usr --disable-debug \
  && make -j$(nproc) \
  && make install \
  && cd ../rtorrent-0.9.6 \
  && ./autogen.sh \
  && ./configure --prefix=/usr --with-xmlrpc-c --disable-debug \
  && make -j$(nproc) \
  && make install \
  && cd / \
  && rm -rf /build \
  && apk del build-deps cppunit-dev

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
