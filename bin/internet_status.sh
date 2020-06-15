#!/bin/bash

if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
    echo "DN"
else
    echo "UP"
fi
