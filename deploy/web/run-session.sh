#!/bin/sh
exec timeout --signal=TERM --kill-after=10s 1h docker run --rm --init -it \
  --stop-timeout 2 \
  --network none \
  --read-only \
  --tmpfs /work:rw,noexec,nosuid,nodev,size=32m,uid=10001,gid=10001,mode=0700 \
  --cap-drop ALL \
  --security-opt no-new-privileges:true \
  --pids-limit 64 \
  --memory 256m \
  --memory-swap 256m \
  --cpus 0.50 \
  --ulimit nofile=128:128 \
  --user 10001:10001 \
  --env HOME=/work \
  --env TERM=xterm-256color \
  l123-web:a757fa9-secure
