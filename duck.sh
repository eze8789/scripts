#!/bin/bash

token="$1"

echo url="https://www.duckdns.org/update?domains=winterfell01&token="$token"&ip=" | curl -k -o /var/log/duckdns/duck.log -K -

