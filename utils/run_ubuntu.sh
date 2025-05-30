#!/usr/bin/env bash
set -euo pipefail

IMAGE="tankbot-sim"

docker run --rm -it \
  --gpus all \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -e DISPLAY=$DISPLAY \
  -e NVIDIA_VISIBLE_DEVICES=0 \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -v "$(pwd)/modules:/sim_ws/src:ro" \
  "${IMAGE}" "$@"


