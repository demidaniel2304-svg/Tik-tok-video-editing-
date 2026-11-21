#!/usr/bin/env bash
# Stitches the raw clips into base.mp4 for the full day-out vlog (storyboard order).
# Each entry: file  in-point  length  speed   (speed 0.5 = half-speed slow motion)
set -euo pipefail
cd "$(dirname "$0")"; R=../raw
SHOTS=(
  "01_PXL_20261115_152140885.mp4 0.0 1.7 1"    # Dickens Inn outside: balconies
  "01_PXL_20261115_152140885.mp4 3.4 1.4 1"    # Dickens Inn outside: sign (skips the hedge)
  "02_PXL_20261115_153052611.mp4 0.0 3.4 1"    # inside the pub
  "03_PXL_20261115_164348019.mp4 0.2 4.0 1"    # fish and chips
  "04_PXL_20261115_170849155.mp4 0.0 4.2 1"    # walking into the market
  "05_PXL_20261115_170942328.mp4 0.2 4.2 1"    # phone box, carol singers, mulled wine
  "09_PXL_20261115_172324092.mp4 0.5 3.2 1"    # trees and lights
  "07_PXL_20261115_172159189.mp4 0.0 4.0 1"    # hot chocolate stall
  "11_PXL_20261115_172948948.mp4 0.0 2.6 1"    # the hot chocolate
  "06_PXL_20261115_171051707.mp4 0.0 3.5 0.5"  # the galleon, half speed (7s)
)
XF=0.3
V="scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,setsar=1"
# Some clips are HDR (HLG). Tone-map those to standard colour so every shot matches.
HDR2SDR="zscale=t=linear:npl=100,format=gbrpf32le,zscale=p=bt709,tonemap=hable:desat=0,zscale=t=bt709:m=bt709:r=tv,"
SDR="scale=out_range=tv:out_color_matrix=bt709,"
inputs=(); fc=""; i=0; t=0; prevv=""; preva=""
for s in "${SHOTS[@]}"; do
  read -r f ss len sp <<<"$s"
  inputs+=(-ss "$ss" -t "$len" -i "$R/$f")
  d=$(python3 -c "print(round($len/$sp,3))")
  trc=$(ffprobe -v error -select_streams v:0 -show_entries stream=color_transfer -of csv=p=0 "$R/$f")
  if [ "$trc" = "arib-std-b67" ] || [ "$trc" = "smpte2084" ]; then C="$HDR2SDR"; else C="$SDR"; fi
  if [ "$sp" = "1" ]; then
    fc+="[$i:v]${C}$V,fps=30,format=yuv420p,settb=1/30[v$i];[$i:a]aresample=48000,aformat=channel_layouts=stereo[a$i];"
  else
    fc+="[$i:v]${C}$V,setpts=PTS/$sp,fps=30,format=yuv420p,settb=1/30[v$i];[$i:a]aresample=48000,aformat=channel_layouts=stereo,atempo=$sp[a$i];"
  fi
  if [ $i -eq 0 ]; then prevv="v0"; preva="a0"; t=$d
  else
    off=$(python3 -c "print(round($t-$XF,3))")
    fc+="[$prevv][v$i]xfade=transition=fade:duration=$XF:offset=$off[vx$i];[$preva][a$i]acrossfade=d=$XF[ax$i];"
    prevv="vx$i"; preva="ax$i"; t=$(python3 -c "print(round($t+$d-$XF,3))")
  fi
  i=$((i+1))
done
fo=$(python3 -c "print(round($t-0.6,3))")
fc+="[$prevv]fade=t=out:st=$fo:d=0.6,format=yuv420p[v];[$preva]afade=t=out:st=$fo:d=0.6,loudnorm=I=-16:TP=-1.5[a]"
ffmpeg -v error -y "${inputs[@]}" -filter_complex "$fc" -map "[v]" -map "[a]" \
  -c:v libx264 -crf 17 -preset medium -g 30 -color_primaries bt709 -color_trc bt709 -colorspace bt709 -c:a aac -b:a 192k -ar 48000 -movflags +faststart base.mp4
echo "base.mp4: ${t}s"
