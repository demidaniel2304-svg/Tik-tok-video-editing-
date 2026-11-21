#!/usr/bin/env bash
# Rebuilds project/base.mp4 from the raw clips (selfie -> stall -> hot chocolate).
set -euo pipefail
cd "$(dirname "$0")"; R=../raw
V="scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,fps=30,format=yuv420p,setsar=1"
A="aresample=48000,aformat=channel_layouts=stereo"
ffmpeg -y -i $R/04_PXL_20261115_172246410.mp4 -i $R/03_PXL_20261115_172159189.mp4 -i $R/07_PXL_20261115_172948948.mp4 -filter_complex "
[0:v]$V,settb=1/30[v0];[1:v]$V,settb=1/30[v1];[2:v]$V,settb=1/30[v2];
[0:a]$A[a0];[1:a]$A[a1];[2:a]$A[a2];
[v0][v1]xfade=transition=fade:duration=0.3:offset=4.8[v01];[v01][v2]xfade=transition=fade:duration=0.3:offset=9.35,fade=t=out:st=11.4:d=0.55[v];
[a0][a1]acrossfade=d=0.3[a01];[a01][a2]acrossfade=d=0.3,afade=t=out:st=11.4:d=0.55,loudnorm=I=-16:TP=-1.5[a]" \
  -map "[v]" -map "[a]" -c:v libx264 -crf 17 -preset medium -c:a aac -b:a 192k -ar 48000 -movflags +faststart base.mp4
