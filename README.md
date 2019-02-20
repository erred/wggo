# wggo

[![Build](https://img.shields.io/badge/endpoint.svg?url=https://badger.seankhliao.com/r/github_seankhliao_wggo)](https://console.cloud.google.com/cloud-build/builds?project=com-seankhliao&query=source.repo_source.repo_name%20%3D%20%22github_seankhliao_wggo%22)
[![License](https://img.shields.io/github/license/seankhliao/wggo.svg?style=for-the-badge)](LICENSE)

Dockerfile for [wireguard-go](https://git.zx2c4.com/wireguard-go/about/)

**Warning**: you should probably be using kernel modules

## Motivation

Running wireguard in a container with kernel modules disabled (ie. GKE coos)

## Build

```
docker build --net=host .
```

## Run

Note: expose ports as appropriate

```
docker run --rm \
  -v /dev/net/tun:/dev/net/tun \
  -v /abs/path/to/wg-quick/conf/file:/etc/wireguard/name_of_interface.conf \
  --cap-add=NET_ADMIN \
  -p port:expose \
  seankhliao/wggo

```
