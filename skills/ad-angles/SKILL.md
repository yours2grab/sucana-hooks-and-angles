---
name: ad-angles
description: "Ad Flywheel angle and hook generator. Generates 5-8 ad angles with hooks, emotional triggers, cognitive biases, and script structures for any product. Includes angle comparison mode. MANDATORY triggers on: generate angles, ad angles, new angles, hook ideas, ad hooks, angle ideas, create angles, brainstorm hooks, ad concepts, creative angles. Always use this skill when the user wants to generate advertising angles, hooks, or creative concepts for a product."
---

# AD ANGLES — Hook & Angle Generator

## Rules

- `{WORKSPACE}` = the directory containing the `ad-flywheel/` folder. Search current directory first, then `~/ad-flywheel/`, `~/Program/ad-flywheel/`.
- ALWAYS load playbook before generating (fail gracefully if no playbook exists — use defaults)
- Generate 5-8 angles per product (never fewer than 5)
- Each angle must target a SPECIFIC micro-avatar, not a generic audience
- Hooks must grab attention in the FIRST SECOND — be specific, not clever
- NEVER generate generic angles like "highlight product benefits" — every angle needs a sharp point of view

## MANDATORY Reading (Before Doing ANYTHING)

You MUST read these reference files IN ORDER before generating angles:
1. `references/hook-patterns.md` — 7 core hook pattern types
2. `references/emotional-triggers.md` — emotional levers and cognitive biases catalog
3. `references/dr-techniques.md` — direct response frameworks and testing hierarchy

## Step 0: Load Context

1. Read `{WORKSPACE}/ad-flywheel/config/playbook.md` — the agency's context
   - If no playbook exists, ask: "No playbook found. Want to describe your product and audience, or run /ad-setup first?"
2. Read `{WORKSPACE}/ad-flywheel/winning-ads/patterns.md` — if it exists AND has content beyond the header, these are PROVEN patterns from past winners. Weight them heavily. If the file is empty or only has a header with no patterns listed, skip it silently — this just means no flywheel data exists yet. Do NOT mention its absence to the user.
3. Read `{WORKSPACE}/ad-flywheel/products/{slug}/research.md` — if it exists for this product, use it as primary context. If no research.md exists, that's fine — use the playbook context + whatever the user provides about the product. You do NOT need research.md to generate angles.

## Step 1: Identify the Product

If the user already named the product in their prompt (e.g., "generate angles for FitTrack Pro"), use that directly — don't re-ask.

Otherwise, ask: "What product are you generating angles for?"

- If they name an existing product (check `products/` directory), load its research
- If it's a new product, ask for a brief description (even 1-2 sentences works)
- If they provide detailed info, use it all

Create the product slug (lowercase, hyphens): `{product-name}` → `product-name`

## Step 2: Generate Angles

Generate 5-8 angles. Each angle is a COMPLETE strategic brief, not just a headline.

For EACH angle, the generation must consider:
- The agency's playbook (audience, product, goals)
- Winning patterns from past ads (if patterns.md exists)
- The testing hierarchy: Angle is king. The MESSAGE matters most. Within one message, there are many ways to say it.
- Micro-avatars: each angle should speak to a specific type of person within the target audience, not the generic audience

**Internal generation logic (abstracted from Victor's methodology):**

The system thinks about angles through these lenses:
- What AWARENESS LEVEL is this angle targeting? (Unaware → Most Aware)
- What MICRO-AVATAR is this for? (Specific person within the audience, with specific beliefs, fears, desires, objections)
- What EMOTIONAL LEVER is primary? (Fear, desire, frustration, curiosity, social proof, urgency)
- What COGNITIVE BIAS does this exploit? (Loss aversion, anchoring, social proof, authority, scarcity)
- What DR TECHNIQUE structures it? (PAS, BAB, AIDA, Star-Story-Solution)
- What HOOK PATTERN grabs attention? (Time+Action, Unexpected Truth, Personal Stakes, etc.)

Most ads fail. 90% of them. Generate DIVERSE angles — different awareness levels, different emotional levers, different avatar types. Don't cluster around one approach. The goal is to find the 10% that wins, and diversity increases the odds.

## Output Format

For each angle:

```markdown
## Angle {N}: {Angle Name}

**Core Message:** {1 sentence — the ONE thing this ad communicates}
**Micro-Avatar:** {Who specifically this speaks to — be narrow and specific}
**Awareness Level:** {1-5, with label}
**Emotional Lever:** {Primary emotion being triggered}
**Cognitive Bias:** {e.g., loss aversion, social proof, authority}
**DR Technique:** {e.g., PAS, BAB, AIDA}

### Hooks (3 variants)
1. {Hook A} — Pattern: {which hook pattern}
2. {Hook B} — Pattern: {which hook pattern}
3. {Hook C} — Pattern: {which hook pattern}

### Ad Structure Outline
1. **Hook** (0-3s): {what happens — visual + spoken}
2. **Problem** (3-15s): {what pain is agitated}
3. **Solution** (15-30s): {how product is introduced}
4. **Proof** (30-45s): {what evidence is shown}
5. **CTA** (45-60s): {what action is requested}

### Why This Works
{2-3 sentences connecting the angle to the avatar's psychology. Why will THIS person stop scrolling? Why will THIS message convert THEM specifically?}
```

## Step 3: Present Angles

Show ALL generated angles in chat with a clear numbered list.

After showing all angles, say:
"Which angles do you want to develop into scripts? Give me the numbers (e.g., '1, 3, 5'). You can also:"
- "**Compare:** 'compare 2 vs 5' — I'll show a side-by-side analysis"
- "**Regenerate:** 'regenerate with more [fear-based / curiosity / social proof] angles'"
- "**Edit:** 'edit angle 3 — make the hook shorter'"

## Step 4: Comparison Mode

When the user asks to compare two angles (e.g., "compare 2 vs 5"):

Present side-by-side:

```markdown
## Angle {A} vs Angle {B}

| Dimension | Angle {A}: {name} | Angle {B}: {name} |
|-----------|-------------------|-------------------|
| Avatar | {who} | {who} |
| Awareness | {level} | {level} |
| Emotion | {lever} | {lever} |
| Strength | {main advantage} | {main advantage} |
| Risk | {potential weakness} | {potential weakness} |
| Best For | {when to use this one} | {when to use this one} |

**Recommendation:** {Which one to try first and why, based on the agency's goals and any winning patterns data}
```

Return to selection after comparison.

## Step 5: Save Selected Angles

Once the user selects angles:

1. Create `{WORKSPACE}/ad-flywheel/products/{slug}/` directory if it doesn't exist
2. Save ALL generated angles (not just selected) to `products/{slug}/angles.md`:

```markdown
# Ad Angles: {Product Name}
Generated: {YYYY-MM-DD}
Selected for scripts: {comma-separated angle numbers}

{all angle content}
```

3. Update `flywheel-state.md` dashboard:
   - Add or update the product row
   - Set Angles column to "{N} angles ({M} selected)"
   - Set Next Action to "Generate scripts for selected angles"

Show: "Angles saved. Run /ad-scripts to generate scripts for your selected angles."

END.
