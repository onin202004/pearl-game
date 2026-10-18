#!/bin/bash
# Testimonials as 9:16: 16:9 sources are center-cropped on the speaker's face.
set -e
B=/home/user/pearl-game/portfolio/builds/nino; cd $B/src/video
while read name pre cx ss; do
  src=$(ls ${pre}*.mp4 | head -1)
  if [ "$cx" = "v" ]; then crop="null"; else crop="crop=405:720:max(0\,min(1280-405\,${cx}*1280-202)):0"; fi
  ffmpeg -nostdin -v error -y -ss $ss -t 6 -i $src -an -vf "$crop,scale=360:640,fps=24" -c:v libx264 -profile:v main -crf 30 -preset slow -pix_fmt yuv420p -movflags +faststart $B/assets/v/$name-p.mp4
  ffmpeg -nostdin -v error -y -ss $ss -i $src -frames:v 1 -vf "$crop,scale=540:960" -c:v libwebp -quality 72 $B/assets/v/$name.webp
  ffmpeg -nostdin -v error -y -i $src -vf "$crop,scale=540:960" -c:v libx264 -profile:v main -crf 30 -preset medium -pix_fmt yuv420p -c:a aac -b:a 80k -ac 2 -movflags +faststart $B/assets/v/$name.mp4
  echo "$name $(du -k $B/assets/v/$name-p.mp4 | cut -f1)K $(du -k $B/assets/v/$name.mp4 | cut -f1)K"
done <<'LIST'
t-jose 26bd 0.47 8
t-peter 440b 0.50 1
t-nick a058 v 1
t-kayla f4b3 0.40 2
t-kristin 3512 0.64 8
LIST
