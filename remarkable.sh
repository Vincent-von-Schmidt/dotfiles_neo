#!/bin/bash

ssh remarkable /sbin/ip addr add 10.11.99.1/32 dev usb0
sudo ip addr add 10.11.99.1/32 dev lo

ssh -o forward -L 10.11.99.1:8080:10.11.99.1:80 remarkable
xdg-open http://10.11.99.1
sudo socat TCP-LISTEN:80,reuseaddr,fork,su=nobody TCP:10.11.99.1:8080

# sudo ip addr del 10.11.99.1/32 dev lo
