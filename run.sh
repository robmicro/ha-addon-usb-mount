#!/bin/sh
echo "USB Media Mount add-on starting..."
RETRIES=0
while [ ! -e /dev/sda1 ] && [ $RETRIES -lt 60 ]; do
  echo "Waiting for /dev/sda1... ($RETRIES/60)"
  sleep 2
  RETRIES=$((RETRIES + 1))
done
if [ -e /dev/sda1 ]; then
  echo "Found /dev/sda1"
  mkdir -p /media/USB
  mount -t ext4 /dev/sda1 /media/USB 2>&1
  if [ $? -eq 0 ]; then
    echo "USB mounted at /media/USB"
    ls /media/USB/ | head -5
  else
    echo "Mount failed!"
  fi
else
  echo "USB device not found after 120s"
fi
while true; do
  if [ -e /dev/sda1 ] && ! mount | grep -q "/media/USB"; then
    echo "Remounting USB..."
    mkdir -p /media/USB
    mount -t ext4 /dev/sda1 /media/USB 2>&1
  fi
  sleep 30
done
