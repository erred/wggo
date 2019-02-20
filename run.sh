#!/bin/sh

set -e

# Find a Wireguard interface
interfaces=`find /etc/wireguard -type f`
if [ -z $interfaces ]; then
    echo "$(date): Interface not found in /etc/wireguard" >&2
    exit 1
fi

interface=`echo $interfaces | head -n 1`

echo "$(date): Starting Wireguard"
wg-quick up $interface

# Handle shutdown behavior
finish () {
    echo "$(date): Shutting down Wireguard"
    wg-quick down $interface
    exit 0
}

trap finish SIGTERM SIGINT SIGQUIT

# busybox doesn't have sleep infinity
tail -f /dev/null
