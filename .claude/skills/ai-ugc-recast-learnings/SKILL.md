---
name: ai-ugc-recast-learnings
description: Lessons learned producing AI UGC / drama ad recasts and hook variants for Serlino Lab (Higgsfield: Nano Banana 2 keyframes + Gemini Omni video). Load at the start of ANY new ad brief, recast, or hook-variant job — before writing a storyboard or generating anything — so past mistakes are not repeated.
---

# AI UGC ad recast: learnings (from A4.1462 older-lead recast, Oct 2026)

These are the things the user (Taglish-speaking creative lead at Serlino Lab) corrected or approved.
Apply them by default on every new brief.

## 1. Process and approvals
- **Characters first, then storyboard.** Give 3 lead options (one = the original actor aged/changed), each with an
  "after" transformation pic, and get a pick before any scene work.
- **Storyboard follows the brief's order** (hook numbering exactly as the brief lists it). Use the "new AI brief
  storyboard" artifact format. Rebuild and republish it after every change.
- **Every image needs approval before it is animated.** Never batch-animate unapproved keyframes.
- **One hook at a time.** Finish images → approval → video → rough cut, then ask before moving to the next hook.
- **Credit update after every generation** (call `balance`). The workspace is shared (other people and Codex
  spend from it), so report your own spend and note any other drop.
- **Split work with Codex.** Confirm which hooks Codex owns and never generate those.
- Before generating, **check what already exists and reuse it** (e.g. the shared S4 hallway scene was reused across hooks).
  Keep a per-project asset registry skill so a new session knows what is done.

## 2. Image (keyframe) rules: `nano_banana_2`, 9:16, 2k
- A face swap into the original frame alone came out flat and was rejected. Ask for **more intense** frames:
  moodier low-key light, stronger emotion, props that tell the story (beer cans, crumpled cash).
- When asked for "more realistic": prompt for a **candid phone-video still, natural matte skin with pores, no oily sheen,
  no airbrushing, light film grain, slightly imperfect focus**, and a real-looking location.
- Offer **2 options per shot** with a short pro/con and a recommendation.
- **Wardrobe continuity:** the same character in the same scene or hook must wear the same outfit. Check it against the
  previous shot before sending.
- **Logical staging:** someone drives a moving vehicle; people don't look into the camera unless the original does;
  no one sits in impossible places (e.g. in a truck bed).
- Check that logos and on-screen signage aren't cropped (call it out if they are).
- **Over-the-shoulder "reveal" frames work well:** the lead seen from behind, with the betrayal visible in the background
  (e.g. paying at the gym desk while the wife and trainer are visible behind him).
- **Content filter:** suggestive gym or physical-contact wording gets blocked as nsfw. Rephrase tamer (hand-holding,
  "counting reps", outfit swaps such as leggings) and retry. Blocked jobs don't seem to be charged.
- **To fix one thing** (e.g. outfit), edit the approved image with it as reference image 1 and change ONLY that element.

## 3. Video rules: Gemini Omni only (`gemini_omni_flash_1_1`)
- image-to-video, 1080p, 9:16, durations 4/6/8/10, always `declined_preset_id: 24bae836-2c4a-48e0-89b6-49fcc0b21612`
  (otherwise the submission fails with a preset recommendation). No Kling/Veo unless the user says so.
- **3-part prompt (Kristian Jennings):** (1) scene + explicit camera ("Static, locked-off shot"), (2) dialogue in quotes
  or "Dialogue: none.", (3) Rules: "One continuous take, no jump cuts, no change of camera angle", camera never moves,
  faces/hair/wardrobe locked to the start frame, audio description, no captions. Lock the prompt; swap only dialogue.
  CAPS for stress words. Pad the duration if a line falls between 4/6/8/10.
- **Check every clip for jump cuts** (`ffmpeg -vf "select='gt(scene,0.2)',showinfo"`) and look at a frame strip
  before sending. Retake on any cut.
- **Doors/exits warp:** when a character walks out through a door, Omni morphs the door and frame. Keep the character in
  place (turn away, look back) and add a Rule: "The door, the door frame and the walls stay completely still."
- Keep actions simple and short (one beat per 4 s clip). Generate 2 takes for risky shots and pick the clean one.
- Need a 3 s clip? Omni's minimum is 4 s, so **trim an existing clip with ffmpeg (0 credits)** before generating.
- Typical cost: Nano Banana 2 image ≈ 2 cr; Omni 4 s ≈ 18 cr.

## 4. Edit, VO and delivery
- "Recast only" means keeping the original VO/audio and timing. Detect the original cut points with ffmpeg scene detection
  and get word timings with faster-whisper; trim the new clips to the exact shot lengths.
- Rough cut: clip audio as a bed at 0.25, the VO/original audio on top, reused dialogue clips at full volume,
  `alimiter=limit=0.95`. Verify the final mix with whisper (no overlaps, all lines present).
- **Always send the VO** with a hook: narration-only WAV, full original hook audio, and the rough-cut mix.
- Fast-paced cuts (extra angles, 1.5–2.5 s each) were liked. Offer extra angles when a shot feels static.
- Naming: keyframes `SL_CHAR_Lead*_H#S#_[Shot]_NanoBanana2_v#`, clips `SL_<ADID>_H#_S#_[Shot]_GeminiOmni_v#.mp4`.
  Save per hook folder, commit + push, deliver with SendUserFile, keep zips < 30 MB.
- Reply in Taglish, keep messages short, give a recommendation (not just options).
