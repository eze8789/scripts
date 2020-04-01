#!/bin/bash

host="$1"
port="$2"

if [ -z "$host" ] || [ -z "$port" ]; then
  echo "usage: tcp_port_status.sh <hostname> <port>" 
  exit 1
fi  

</dev/tcp/"$host"/"$port" && echo Port is open || echo Port is closed
