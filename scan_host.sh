#!/bin/sh

ip="$1"

if [ -z "$ip" ]; then
  echo "usage: scan <ip>"
  exit 1
fi

ports=$(nmap -p- --min-rate=1000  -T4 "$ip" |\
  grep ^[0-9]     |  \
  cut -d '/' -f 1 |  \
  tr '\n' ','     |  \
  sed s/,$//         \
)

if [ -z "$ports" ]; then
  echo "No host (or ports) found."
  exit 0
fi

# For a full list of all script run by -sC:
# <https://nmap.org/nsedoc/categories/default.html>

nmap -v -sC -sV -p$ports "$ip" | tee nmap.out

