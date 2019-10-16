# wggo

[wireguard-go](https://git.zx2c4.com/wireguard-go/about/) in a container, becuase `WG_I_PREFER_BUGGY_USERSPACE_TO_POLISHED_KMOD=1`

[![License](https://img.shields.io/github/license/seankhliao/wggo.svg?style=flat-square)](LICENSE)
[![Docker](https://img.shields.io/docker/cloud/build/seankhliao/wggo?style=flat-square)](https://hub.docker.com/r/seankhliao/wggo)

## About

I ~~needed~~ wanted to run a wireguard VPN server on a system without access to kernel modules (GKE coos)

Based on [activeeos/wireguard-docker](https://github.com/activeeos/wireguard-docker), kernel module version of wireguard in a container, which you should probably be using

## Usage

#### Prerequisites

- `CAP_NET_ADMIN` and `/dev/net/tun`
- A `wg-quick` config file

#### Run

1. mount conf file into `/etc/wireguard/`, (name doesn't matter)
2. expose the port as specified in conf file

```sh
docker run --rm \
  --cap-add=NET_ADMIN \
  -v /dev/net/tun:/dev/net/tun \
  -v /abs/path/to/wg-quick/conf/file:/etc/wireguard/name_of_interface.conf \
  -p port:expose \
  seankhliao/wggo
```

#### Build

With docker:

```sh
docker build \
  --network host \
  .
```

## Links

- [activeeos/wireguard-docker](https://github.com/activeeos/wireguard-docker): kernel mod version
