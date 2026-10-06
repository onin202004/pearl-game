---
name: serlino-a41462-recast
description: Serlino Lab A4.1462 "Italian Gentlemen" older-lead recast. Load whenever working on this ad, its hooks (H1–H5), the body recast, or any Higgsfield generation for it. Lists every asset already made so you reuse instead of regenerating, plus the team's locked workflow rules.
---

# Serlino Lab · A4.1462 Older-Lead Recast

Goal: recast the winning ad A4.1462 (men's retinol + Italian olive oil anti-wrinkle cream, 60-day guarantee)
with an older male lead to test if an older demo converts higher. **Only the lead changes.** VO, scenes,
cut and timing stay the same. Body starts at "Six months later…" (VID1 0:16.64); everything before is a hook.

## Lead (locked) — Option B "Silver beard", 64
- Before: 64-y/o Italian-American, tall, lean face, long straight nose, high cheekbones, pale grey-blue eyes,
  light olive skin, thick straight pure-white hair overgrown over forehead, short scraggly white full beard,
  deep frown lines, hollow cheeks, heavy eye bags, soft paunch.
- After (v4, approved, reads ~52): white hair cut and swept back, beard trimmed sharp, smooth forehead, no eye bags, tight jaw.
- Higgsfield refs: lead character sheet `84a1975e-bde6-42a2-b025-83365558c02e`, Rachel sheet `439111a3-b46c-495e-8e68-0f733e520edd`.
- Narrator voice element: `9035b45d-d909-448f-acc5-c6a32885f4a8` (SL_VID2_Mike_Narrator).

## Hooks (brief order) and status
| Hook | Owner | Status |
|---|---|---|
| H1 Pickleball | Claude | S1–S4 done, rough cut v1 (`A41462_OlderRecast/H1_Pickleball/`) |
| H2 Clubhouse Swing | Claude | S1–S4 done, rough cut v1 (`H2_Clubhouse/`) |
| H3 Ballroom Dance | **Codex** (do NOT generate) | in Higgsfield, by Codex |
| H4 Landscaper/Patio | Claude | S1–S4 + 6 extra angles, fast-pace rough cut v2 (`H4_Patio/`, `H4_Patio/Angles/`) |
| H5 Gym (winning hook) | Claude | S1–S3 new + S4 reused (H2), rough cut v1 (`H5_Gym/SL_A41462OLD_H5_Gym_RoughCut_v1.mp4`, 16.1 s) |

## REUSE before you generate
**S4 Hallway (Rachel's parting words) is already made — it is the shared S4 for every hook. Do not regenerate it.**
- `H1_Pickleball/SL_A41462OLD_H1_S4_Hallway_GeminiOmni_v2.mp4` — "Have you looked at yourself lately? You've really let yourself go." (3/4 angle, both looking at each other)
- `H2_Clubhouse/SL_A41462OLD_H2_S4_Hallway_GeminiOmni_v1.mp4` — "Take a good look in the mirror. You've really let yourself go."
- `H4_Patio/SL_A41462OLD_H4_S4_Hallway_GeminiOmni_v1.mp4` — "Have you looked at yourself? You've really let yourself go."
For H5, use one of these as S4 (closest to the original line "Take a look at yourself. You really let yourself go." is the H2 one).

Other reusable clips: H4 angle clips (S1A kitchen 3/4, S1B through glass + 3 s trim, S2A close-up, S2B window POV,
S3A rear driveway, S3B inside cab) in `H4_Patio/Angles/`.

## H5 Gym (winning hook) — VID1 0–16.64 s
| Shot | Time | VO (original audio kept) | Plan |
|---|---|---|---|
| S1 recliner | 0–3.7 | "She used to say she went to the gym to do squats" | v2 "intense" keyframe S1-A (job `a9fe5b2a-5228-4d39-a5e1-e8b1385ed180`) APPROVED → `H5_Gym/SL_A41462OLD_H5_S1_Recliner_GeminiOmni_v1.mp4` |
| S2 squats | 3.72–7.44 | "…just not with weights" | User asked for a new angle + more realistic: new keyframe S2-A wide (secret-watcher view behind dumbbell rack), wardrobe fixed to match S1 (black tank + black shorts w/ white trim) → job `6a839ec7-82ce-466c-a7ac-73e320acd39a`, APPROVED, animated: `H5_Gym/SL_A41462OLD_H5_S2_GymSquat_GeminiOmni_v1.mp4`. Original footage kept as fallback: `H5_Gym/SL_A41462OLD_H5_S2_Squats_OriginalVID1.mp4`. Explicit squat-over-trainer wording trips the nsfw filter; keep it tame. |
| S3 gym desk | 7.4–10.0 | "…personal trainer I was paying for" | User redirected: Mike seen FROM BEHIND at the desk paying (cash + payment slip) while the S2 squat is visible in the background. Options: A `26e1ca55-c48c-48b3-a778-9d14a1dc2246` (3/4 back, he watches them, logo cropped), B `e20b3475-4a06-40a2-8870-0af0fe8fad70` (full back, logo intact) → A PICKED, animated: `H5_Gym/SL_A41462OLD_H5_S3_FrontDesk_GeminiOmni_v1.mp4`. (Older face-on S3 options 6cc860d6/4b60e392 dropped.) |
| S4 hallway | 10.0–16.6 | "Her parting words…" | REUSE shared S4 above |
Original frames (Higgsfield media): S1 `a1e8ae8f-5659-49c7-b117-bc0e9cd9a4d4`, S3 `b02058fe-6112-4779-b13d-305f942dcd46`, S4 `f015cef3-3dfd-484e-8de2-1507c3298c19`.
User feedback: first H5 swaps were too flat — make frames **more intense** (moodier light, stronger emotion).

## Workflow rules (user-locked)
1. **Get image approval before animating.** Never animate an unapproved keyframe.
2. **Credit update after every generation** (call `balance`; shared SerlinoLab workspace, Codex spends too).
3. **Gemini Omni only** for video (`gemini_omni_flash_1_1`, image-to-video, 1080p, 9:16, durations 4/6/8/10,
   always pass `declined_preset_id: 24bae836-2c4a-48e0-89b6-49fcc0b21612`). No Kling/Veo unless the user says so.
   Keyframes: `nano_banana_2`, 9:16, 2k.
4. Kristian Jennings 3-part Omni prompt: (1) scene + explicit camera ("Static, locked-off shot"); (2) dialogue in quotes
   (or "Dialogue: none."); (3) Rules incl. "One continuous take, no jump cuts, no change of camera angle",
   faces/wardrobe locked, audio, no captions. Lock the prompt, swap only dialogue. CAPS for stress words.
5. Keep wardrobe continuity across shots of the same scene/hook (e.g. Rachel's S1 outfit = S2 outfit).
6. Check every clip for jump cuts (`ffmpeg select='gt(scene,0.2)'`); retake if any.
6. Shots with a lead must keep his look consistent with the sheet; no one looks at camera unless the original does;
   logical staging (e.g. a driver in a moving truck).
7. Fast-pace style is welcome: extra angles per shot, cut 1.5–2.5 s each.
8. Need a short clip (e.g. 3 s)? Omni min is 4 s — trim an existing clip with ffmpeg (0 credits) first.

## Naming / delivery
- Keyframes: `SL_CHAR_LeadB_H#S#_[Shot]_NanoBanana2_v#.png`; clips: `SL_A41462OLD_H#_S#_[Shot]_GeminiOmni_v#.mp4`.
- Save to `A41462_OlderRecast/H#_[Name]/`, commit + push to branch `claude/keen-cerf-jnkjco`.
- Deliver with SendUserFile; zips must be < 30 MB (split or re-encode crf 22).
- Storyboard: scratchpad `build_sb.py` → `sb/index.html` (artifact, H1→H5 order). Rebuild + republish after changes.
- User writes Taglish; reply in Taglish.

## H5 rough cut recipe (v1)
S1 0–3.72 · S2 0.1–3.82 · S3 0.6–3.2 · S4 = H2 S4 full 6.04 s (its own audio, Rachel's line). Audio: VID1 original 0–10.9 (lead VO, fade at 10.75) + clip audio bed 0.25 + S4 audio at 10.04 s.
