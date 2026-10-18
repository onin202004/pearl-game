"""Package the portfolio into one organized zip.

Nino-Portfolio/
  README.txt
  website/              ready to upload: index.html + engine + every asset the page uses
  videos/NN-Section/    each full ad (with sound), named by brand
  photos/               portraits and share image
  BRIEF.md
"""
import os
import re
import sys
import zipfile

B = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
out = sys.argv[1]
html = open(os.path.join(B, 'index.html'), encoding='utf-8').read()

used = sorted(set(re.findall(r'assets/(?:v|img)/[A-Za-z0-9._-]+', html)))
missing = [u for u in used if not os.path.exists(os.path.join(B, u))]
if missing:
    sys.exit('missing assets: %s' % missing)

# Full ads grouped by the section they appear in, in page order.
sections = re.findall(r'<section[^>]*id="([a-z]+)" data-clip="([^"]+)"(.*?)</section>', html, re.S)
videos = []
n = 0
for sid, label, body in sections:
    clips = re.findall(r'data-full="(assets/v/[^"]+)" data-title="([^"]+)"', body)
    if not clips:
        continue
    n += 1
    folder = '%02d-%s' % (n, re.sub(r'[^A-Za-z0-9]+', '-', label).strip('-'))
    seen = set()
    for path, title in clips:
        name = re.sub(r'[^A-Za-z0-9 .&-]+', '', title.replace(',', ' -')).strip()
        name = re.sub(r'\s+', ' ', name)
        while name in seen:
            name += ' (2)'
        seen.add(name)
        videos.append((path, 'videos/%s/%s.mp4' % (folder, name)))

readme = """NINO PAGAYANAN PORTFOLIO
========================

website/   Ang buong website, handa nang i-upload (Cloudflare Pages, Netlify, o kahit anong host).
           Buksan ang website/index.html para makita.
videos/    Lahat ng ad na nasa site, buong version na may tunog, naka-folder ayon sa section.
photos/    Mga photo mo at ang share image (lumalabas kapag shinare ang link).
BRIEF.md   Ang design brief at psychology sa likod ng site.

Mga video: 540px wide (vertical) para mabilis sa web. Ang original high-res ay nasa Frame.io mo.

Book a call link: https://calendbook.com/iggvemarketing/interview
"""

with zipfile.ZipFile(out, 'w', zipfile.ZIP_STORED) as z:
    root = 'Nino-Portfolio/'
    z.writestr(root + 'README.txt', readme)
    z.write(os.path.join(B, 'BRIEF.md'), root + 'BRIEF.md')
    for f in ('index.html', 'scrollcraft.css', 'scrollcraft.js'):
        z.write(os.path.join(B, f), root + 'website/' + f)
    for u in used:
        z.write(os.path.join(B, u), root + 'website/' + u)
    for src, dst in videos:
        z.write(os.path.join(B, src), root + dst)
    for f in sorted(os.listdir(os.path.join(B, 'assets/img'))):
        z.write(os.path.join(B, 'assets/img', f), root + 'photos/' + f)

print('website assets:', len(used), '| organized videos:', len(videos))
for _, dst in videos:
    print('  ', dst)
