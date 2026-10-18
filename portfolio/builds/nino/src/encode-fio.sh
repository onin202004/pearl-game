#!/bin/bash
# Encode Frame.io AI ads: 6s silent preview loop from the hook, poster, full ad with sound.
set -e
B=/home/user/pearl-game/portfolio/builds/nino
cd $B/src/fio
for src in *.mp4; do
  name=${src%.mp4}; ss=0.2
  w=$(ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 $src); h=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 $src)
  if [ $w -gt $h ]; then pv="scale=640:-2"; fv="scale=960:-2"; else pv="scale=360:-2"; fv="scale=540:-2"; fi
  ffmpeg -nostdin -v error -y -ss $ss -t 6 -i $src -an -vf "$pv,fps=24" -c:v libx264 -profile:v main -crf 30 -preset slow -pix_fmt yuv420p -movflags +faststart $B/assets/v/$name-p.mp4
  ffmpeg -nostdin -v error -y -ss 1.5 -i $src -frames:v 1 -vf "$fv" -c:v libwebp -quality 72 $B/assets/v/$name.webp
  ffmpeg -nostdin -v error -y -i $src -vf "$fv" -c:v libx264 -profile:v main -crf 30 -preset medium -pix_fmt yuv420p -c:a aac -b:a 80k -ac 2 -movflags +faststart $B/assets/v/$name.mp4
  echo "$name ${w}x${h} $(du -k $B/assets/v/$name-p.mp4 | cut -f1)K $(du -k $B/assets/v/$name.mp4 | cut -f1)K"
done
