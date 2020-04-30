#!/bin/sh

if [ -n "${RTORRENT_GID}" ]; then
  addgroup -g "${RTORRENT_GID}" rtorrent
else
  echo "ERROR: RTORRENT_GID environment variable must be set" 1>&2
  exit 1
fi

if [ -n "${RTORRENT_UID}" ]; then
  adduser -H -D -h /rtorrent -u "${RTORRENT_UID}" -G rtorrent rtorrent
else
  echo "ERROR: RTORRENT_UID environment variable must be set" 1>&2
  exit 2
fi

if [ -d "/rtorrent" ]; then
  chown -R rtorrent:rtorrent /rtorrent
fi

exec s6-setuidgid rtorrent /usr/bin/rtorrent
