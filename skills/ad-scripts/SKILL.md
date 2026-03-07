---
name: ad-scripts
description: "Ad Flywheel script generator. Writes full ad scripts with timestamped sections, visual direction, and creative briefs from selected angles. Supports 15s/30s/60s/90s lengths with revision loop. MANDATORY triggers on: write script, ad script, VSL script, generate script, ad copy, video script, script for ad, create script, write ad, ad creative. Always use this skill when the user wants to write an advertising script or ad copy from an angle."
---

# AD SCRIPTS — Script Generator

## Rules

- `{WORKSPACE}` = the directory containing the `ad-flywheel/` folder. Search the current directory. If the current directory IS `ad-flywheel/`, use it directly.
- ALWAYS load the angle before writing (don't invent angles — use what was selected)
- Scripts must be SPECIFIC to the micro-avatar defined in the angle
- Every spoken line must sound natural — written for speaking, not reading
- Visual direction must be actionable — a video editor should know exactly what to shoot
- Default creative brief: shot list + visual notes. Full brief only when requested.

## Step 0: Load Everything (ONE parallel read)

Read ALL of the following files in a SINGLE parallel batch — do NOT read them one at a time:
- `references/script-templates.md` — timing templates and output format
- `{WORKSPACE}/ad-flywheel/config/playbook.md` — agency context
- `{WORKSPACE}/ad-flywheel/config/naming-convention.md` — ad naming rules (if exists)
- `{WORKSPACE}/ad-flywheel/products/{slug}/angles.md` — the angles to write from
- `{WORKSPACE}/ad-flywheel/products/{slug}/research.md` — audience depth (if exists)
- `{WORKSPACE}/ad-flywheel/winning-ads/winners-library.md` — tone reference (if exists)

## Step 1: Identify What to Write

Ask: "Which product and angle do you want a script for?"

- If they specify a product and angle number → load that angle
- If they just say a product → show the selected angles from angles.md and ask which one
- If no angles exist → suggest running /ad-angles first

Then ask: "What length? (15s / 30s / 60s / 90s)"

- Default to 30s if they don't specify
- Can generate multiple lengths for the same angle if requested

## Step 2: Generate the Script

Write the full script following the timing template for the chosen length. See `references/script-templates.md` for exact timing breakdowns.

**Internal generation logic (abstracted methodology):**

The script must:
- Open with a hook that stops the scroll in 1 second. Be specific to the micro-avatar. Use their language.
- Agitate the problem using words the avatar actually says and thinks. Not marketing speak.
- Introduce the solution through its MECHANISM — what it does and why it works, not just features.
- Stack proof: testimonials, data points, case studies, before/after. The more specific, the more believable.
- Close with a clear, low-friction CTA. Remove risk (guarantee, free trial). Create urgency if genuine.

Every spoken line should pass the "would a real person say this on camera?" test. If it sounds like ad copy, rewrite it.

Visual direction should be specific enough that a video editor can execute without guessing. Include camera angles, text overlays, b-roll suggestions, and talent actions.

## Output Format

Follow the exact format from `references/script-templates.md`:

```markdown
# Script: {Angle Name} — {Length}
Product: {product name}
Angle: {angle number}
Length: {15s / 30s / 60s / 90s}
Generated: {YYYY-MM-DD}

---

## The Script

**[HOOK — 0:00-0:XX]**
_Visual:_ {what the viewer sees}
_Audio:_ "{exact spoken words}"

**[PROBLEM — 0:XX-0:XX]**
_Visual:_ {visual direction}
_Audio:_ "{exact spoken words}"

...continue for all sections...

---

## Creative Brief

### Shot List
1. {Scene}: {camera, framing, talent action}
...

### Production Notes
- **Talent:** {type}
- **Setting:** {environment}
- **Tone:** {energy + mood}
- **Format:** {UGC / talking head / b-roll / etc.}
- **Text Overlays:** {key text on screen}
```

### Naming Convention

If `config/naming-convention.md` exists, generate the ad name following that convention and include it:

```markdown
### Ad Name
`{generated name per convention}`
```

If no convention exists, generate a descriptive filename: `{angle-slug}-{length}.md`

## Step 3: Present Script

Show the full script in chat.

Then say:
"Want to revise anything? You can:"
- **Edit specific sections:** "make the hook more aggressive" / "shorten the problem section"
- **Change tone:** "make it more conversational" / "more urgent"
- **Request full brief:** "give me the full production brief" (adds thumbnail concepts, format specs, b-roll details, music direction, production complexity)
- **Generate another length:** "also give me a 15s version"
- **Approve:** "looks good" / "save it"

## Step 4: Revision Loop

When the user requests changes:

1. Take their feedback
2. Regenerate ONLY the sections they asked to change (keep the rest intact)
3. Show the updated script with changes highlighted (mark changed sections)
4. Return to Step 3 for another round of review

Repeat until the user approves.

## Step 5: Full Production Brief (On Request)

When the user asks for a "full brief" or "full production brief":

Add these sections after the standard creative brief (see `references/script-templates.md` for exact format):

- **Thumbnail Concepts** — 3 options with description
- **Format Specs** — aspect ratios, resolution, file format
- **B-Roll Suggestions** — specific shots with purpose
- **Music & Sound Direction** — style, tempo, key moments, SFX
- **Production Complexity** — difficulty level, estimated shoot time, post-production needs, assets to prepare

## Step 6: Save Script

Once approved:

1. Save to `{WORKSPACE}/ad-flywheel/products/{slug}/scripts/{angle-slug}-{length}.md`
2. Update `flywheel-state.md` dashboard:
   - Update Scripts column for this product
   - Set Next Action based on what's missing (more scripts? performance data?)

Show: "Script saved to {path}."
Show: "Next: Generate more scripts, or once ads are running, use /ad-performance to track results."

END.
