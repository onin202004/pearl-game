#!/bin/bash
# name source_prefix preview_start
set -e
B=/home/user/pearl-game/portfolio/builds/nino
cd $B/src/video
while read name pre ss; do
  src=$(ls ${pre}*.mp4 | head -1)
  w=$(ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 $src); h=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 $src)
  if [ $w -gt $h ]; then pv="scale=640:-2"; fv="scale=960:-2"; else pv="scale=360:-2"; fv="scale=540:-2"; fi
  # 6s silent preview loop
  ffmpeg -nostdin -v error -y -ss $ss -t 6 -i $src -an -vf "$pv,fps=24" -c:v libx264 -profile:v main -crf 30 -preset slow -pix_fmt yuv420p -movflags +faststart $B/assets/v/$name-p.mp4
  # poster from preview start
  ffmpeg -nostdin -v error -y -ss $ss -i $src -frames:v 1 -vf "$fv" -c:v libwebp -quality 72 $B/assets/v/$name.webp
  # full with sound
  ffmpeg -nostdin -v error -y -i $src -vf "$fv" -c:v libx264 -profile:v main -crf 30 -preset medium -pix_fmt yuv420p -c:a aac -b:a 80k -ac 2 -movflags +faststart $B/assets/v/$name.mp4
  echo "$name $(du -k $B/assets/v/$name-p.mp4 | cut -f1)K $(du -k $B/assets/v/$name.mp4 | cut -f1)K"
done <<'LIST'
freebird 471f 0.5
spudsy 7c63 0.5
kamado 62e8 1
product aacf 1
trainers faac 0.5
agency 9b93 0.5
hockey a441 0.5
visus-electrician 447d 0.5
visus-hiking f39a 0.5
visus-dog 1f30 0.5
visus-mechanic 0c4e 0.5
ai-podcast a93f 0.5
ai-fitme c020 0.5
ai-bloomchic 6a37 1
short-1 a058 1
short-2 92c9 0.5
yt-viana 26bd 5
yt-2 440b 1
t-kayla f4b3 2
t-kristin 3512 2
LIST
