#!/usr/bin/env bash
# Same footage as the titled version: build it there, then copy it here.
set -euo pipefail
cd "$(dirname "$0")"
../full/build-base.sh
cp ../full/base.mp4 base.mp4
