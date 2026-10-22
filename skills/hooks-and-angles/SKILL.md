---
name: hooks-and-angles
description: "Ad Flywheel — generates ad hooks, angles, and scripts for any product. Handles everything: onboarding, product research, angle generation, script writing, performance tracking, and the flywheel feedback loop. MANDATORY triggers on: ad setup, ad angles, ad scripts, ad research, ad performance, generate angles, write script, hook ideas, ad hooks, angle ideas, create angles, brainstorm hooks, ad concepts, creative angles, research product, product research, import ads, winning ads, flywheel, ad metrics, onboard agency, add context, ingest transcript, setup flywheel, configure ads, ad onboarding, VSL script, ad copy, video script, pull metrics, performance data, run flywheel, analyze ads, best ads. Always use this skill for ANY advertising-related request — generating angles, writing scripts, researching products, importing performance data, or running the flywheel."
---

# HOOKS & ANGLES — Ad Flywheel System

One skill. Five modes. Smart routing.

## Rules

- `{WORKSPACE}` = the current working directory. The `ad-flywheel/` folder lives inside it.
- If the current directory IS `ad-flywheel/` (contains `config/` or is named `ad-flywheel`), use it directly — do NOT nest another `ad-flywheel/` inside.
- NEVER modify the playbook without explicit user approval
- Read files in PARALLEL — always batch reads into a single parallel call
- Generate all config content in memory first. Show to user for review. Only write files AFTER user approves.
- Handle missing files gracefully — if a file doesn't exist yet, that's fine, work without it

## Smart Routing

Detect mode from user intent:

| User Says | Mode |
|-----------|------|
| "setup", "onboard", "configure", "add context", "ingest", CSV path provided | **Setup** |
| "research", "new product", "product research", "deep dive" | **Research** |
| "angles", "hooks", "generate angles", "brainstorm", "ad concepts" | **Angles** |
| "script", "write script", "VSL", "ad copy", "video script" | **Scripts** |
| "performance", "import", "metrics", "winning", "flywheel", "best ads" | **Performance** |

If the user just says something like "let's make ads" or gives a product name with no specific mode:
1. Check if `ad-flywheel/config/playbook.md` exists
2. If NO → ask: "Drop your Meta Ads Manager CSV and I'll set everything up from your existing ad data."
3. If YES → ask: "What do you want to do? Research a product, generate angles, or write scripts?"

---

## MODE: Setup — Onboarding via CSV

### Detect Existing Setup

Check if `ad-flywheel/config/playbook.md` exists in the current directory.

- **If NO config** → proceed to fresh setup below
- **If config exists** → skip to **Context Enrichment** at the bottom of this section

### Fresh Setup

#### Step 1: Get the CSV

Ask: "Drop your Meta Ads Manager CSV export — I'll build everything from your existing ad data."

Read the CSV. Identify columns (handle common Meta export variations):

| Data Point | Common Column Names |
|-----------|-------------------|
| Campaign | Campaign name, Campaign Name, campaign_name |
| Ad Set | Ad set name, Ad Set Name, adset_name |
| Ad Name | Ad name, Ad Name, ad_name |
| Impressions | Impressions, impressions |
| Clicks | Link clicks, Clicks (all), clicks |
| CTR | CTR (link click-through rate), CTR (all), ctr |
| CPC | CPC (cost per link click), CPC (all), cpc |
| Conversions | Results, Purchases, Leads, conversions |
| ROAS | Purchase ROAS, Website purchase ROAS, roas |
| Spend | Amount spent, Spend, spend |
| CPR | Cost per result, cost_per_result |

If a column can't be matched, ask. Don't guess.

#### Step 2: Extract Context from CSV

From the CSV data, extract:
- **Brand/product name** — from campaign names and ad names
- **Product slug** — generated from brand/product name
- **Performance benchmarks** — actual ROAS range, CPA range, CTR range from the data
- **What's working** — top performers by ROAS (ads with 5,000+ impressions)
- **What's not** — underperformers and money drains
- **Ad naming patterns** — detect any convention from ad names
- **Audience signals** — infer from ad set names (interests, demographics, lookalikes)

#### Step 3: Create Directory Structure

```
{WORKSPACE}/ad-flywheel/
├── config/
│   ├── playbook.md
│   ├── brand.md
│   └── naming-convention.md
├── products/{slug}/
│   └── performance/
│       ├── imports/{YYYY-MM-DD}-meta.csv
│       └── metrics.md
├── winning-ads/
│   ├── winners-library.md
│   └── patterns.md
└── flywheel-state.md
```

#### Step 4: Generate Everything

Generate `config/playbook.md` from the CSV data:
```markdown
# Agency Playbook

## Brand
{extracted from campaign/ad names}

## Product/Service
{inferred from ad names and campaign structure}

## Performance Benchmarks (from actual data)
- **Current ROAS range:** {min} - {max} (avg: {weighted avg})
- **Current CPA range:** ${min} - ${max}
- **Current CTR range:** {min}% - {max}%
- **Total spend in data:** ${total}
- **Winner threshold:** top 20% by ROAS = ROAS > {calculated threshold}

## What's Working
{top 3-5 ads by ROAS with their metrics — these are the patterns to replicate}

## What's Not Working
{bottom 3-5 ads — these are the patterns to avoid}

## Audience Signals
{extracted from ad set names — targeting, demographics, interests}

---
_Last updated: {YYYY-MM-DD}_
_Bootstrap source: {CSV filename}_
```

Generate `config/brand.md`:
```markdown
# Brand Profile

## Name
{extracted from campaign names}

## Product/Service
{inferred from data}

## Voice & Tone
{to be refined from winning ad scripts}

## Key Differentiators
{to be identified — analyze winning ad copy if available}
```

Generate `config/naming-convention.md`:
- If a pattern is detected in ad names → document it with examples
- If no clear pattern → generate default: `{Product}_{AwarenessLevel}_{Angle#}_{Hook#}_{Length}_{Format}` with examples using the actual product name

Save raw CSV to `products/{slug}/performance/imports/{YYYY-MM-DD}-meta.csv`.

Generate `products/{slug}/performance/metrics.md` with full performance analysis (same format as Performance mode).

Generate `winning-ads/winners-library.md` with top performers.

Generate `winning-ads/patterns.md` — analyze what the winners have in common (ad name patterns, formats, targeting).

Initialize `flywheel-state.md` with the product row populated.

#### HUMAN LOOP: Review

Show:
1. The extracted playbook (brand, benchmarks, what's working/not)
2. Performance summary (top 5 + bottom 5 + overall stats)
3. Any patterns detected

Ask: "Here's what I extracted from your data. Want to correct anything or add context before I save?"

Accept corrections — they know their business better than a CSV reveals. Apply edits, save all files.

Show: "Setup complete. I've already identified your winners. Want me to generate new angles based on what's working?"

### Context Enrichment (Subsequent Runs)

When config already exists and user wants to add context:

Accept new CSVs, transcripts, docs, or notes. Process accordingly:
- **CSV** → run through Performance Import mode, update metrics and patterns
- **Transcripts/docs** → extract insights, append to playbook under relevant sections with date marker:
```markdown
--- Added from: {source name} ({YYYY-MM-DD}) ---
```

Show what was added. Ask for approval before saving.

---

## MODE: Research — Product & Market Deep Dive

### Step R0: Load Context (ONE parallel read)

Read ALL in a SINGLE parallel batch:
- `{WORKSPACE}/ad-flywheel/config/playbook.md`
- `{WORKSPACE}/ad-flywheel/config/brand.md`

### Step R1: Identify the Product

If the user named the product in their prompt, use it. Otherwise ask: "What product do you want to research?"

Accept: product name + description, URL (use WebFetch), or detailed info.

Create slug: `{product-name}` → `product-name`

### Step R2: Research

Use WebSearch to gather:

**A) Product Details** — mechanism, price, features, unique value, differentiators
**B) Target Audience** — demographics, psychographics, online hangouts, their language
**C) Competitive Landscape** — top 3-5 competitors, positioning, gaps, prices
**D) Customer Sentiment** — reviews, Reddit, forums: what they love, hate, object to, the words they use

### Step R3: Generate Research Document

```markdown
# Product Research: {Product Name}
Date: {YYYY-MM-DD}

---

## Product Overview
**What it is:** {1-2 sentences}
**Mechanism:** {how it works}
**Price:** {price point or range}
**Unique Value:** {what competitors can't claim}

## Target Audience

### Primary ICP
**Demographics:** {age, gender, income, location}
**Psychographics:** {values, lifestyle, beliefs}
**Pain Points:** {specific problems — THEIR language}
**Desires:** {the outcome they want}

### 5 Awareness Levels
**Level 1 — Unaware:** {description}
**Language:** "{what they say}"

**Level 2 — Problem Aware:** {description}
**Language:** "{what they say}"

**Level 3 — Solution Aware:** {description}
**Language:** "{what they say}"

**Level 4 — Product Aware:** {description}
**Language:** "{what they say}"

**Level 5 — Most Aware:** {description}
**Language:** "{what they say}"

### Micro-Avatar Seeds
{3-5 specific micro-avatars: who, what they believe, fear, want, main objection}

## Competitive Landscape

| Competitor | Positioning | Price | Strength | Weakness |
|-----------|------------|-------|----------|----------|
| ... | ... | ... | ... | ... |

**Messaging Gaps:** {what competitors aren't saying}

## Emotional Landscape

### Triggers That Drive Action
1. **{Emotion}:** {how it manifests + example language}
2. ...

### Top Objections
1. **"{Objection}"** → Counter: {how to overcome}
...up to 7

## Proof Elements
{testimonials, studies, data, certifications, press}

## Ad Angle Seeds
{3-5 promising angle directions to explore}
```

### HUMAN LOOP: Review

Show research. Ask: "Want to correct anything, add context, or save as-is?"

Save to `products/{slug}/research.md`. Update `flywheel-state.md`.

Show: "Research saved. Want me to generate angles based on this research?"

---

## MODE: Angles — Hook & Angle Generator

### Step A0: Load Everything (ONE parallel read)

Read ALL in a SINGLE parallel batch:
- `references/hook-patterns.md`
- `references/emotional-triggers.md`
- `references/dr-techniques.md`
- `{WORKSPACE}/ad-flywheel/config/playbook.md`
- `{WORKSPACE}/ad-flywheel/winning-ads/patterns.md` (if exists — ignore silently if empty)
- `{WORKSPACE}/ad-flywheel/products/{slug}/research.md` (if exists — use playbook + user input if not)

### Step A1: Identify the Product

If the user named the product in their prompt, use it. Otherwise ask: "What product are you generating angles for?"

- If existing product (check `products/`), load its research
- If new, ask for a brief description
- Create slug

### Step A2: Generate Angles

Generate 5-8 angles. Each is a COMPLETE strategic brief.

**Internal generation logic (abstracted methodology):**

For each angle, consider:
- What AWARENESS LEVEL is this targeting? (Unaware → Most Aware)
- What MICRO-AVATAR is this for? (Specific person with specific beliefs, fears, desires, objections)
- What EMOTIONAL LEVER is primary? (Fear, desire, frustration, curiosity, social proof, urgency)
- What COGNITIVE BIAS does this exploit? (Loss aversion, anchoring, social proof, authority, scarcity)
- What DR TECHNIQUE structures it? (PAS, BAB, AIDA, Star-Story-Solution)
- What HOOK PATTERN grabs attention? (Time+Action, Unexpected Truth, Personal Stakes, etc.)

Most ads fail. 90% of them. Generate DIVERSE angles — different awareness levels, emotional levers, avatar types. Don't cluster around one approach. Diversity increases the odds of finding the 10% that wins.

### Output Format

For each angle:

```markdown
## Angle {N}: {Angle Name}

**Core Message:** {1 sentence — the ONE thing this ad communicates}
**Micro-Avatar:** {who specifically}
**Awareness Level:** {1-5, with label}
**Emotional Lever:** {primary emotion}
**Cognitive Bias:** {e.g., loss aversion, social proof}
**DR Technique:** {e.g., PAS, BAB, AIDA}

### Hooks (3 variants)
1. {Hook A} — Pattern: {which pattern}
2. {Hook B} — Pattern: {which pattern}
3. {Hook C} — Pattern: {which pattern}

### Ad Structure Outline
1. **Hook** (0-3s): {visual + spoken}
2. **Problem** (3-15s): {pain agitated}
3. **Solution** (15-30s): {product introduced}
4. **Proof** (30-45s): {evidence shown}
5. **CTA** (45-60s): {action requested}

### Why This Works
{2-3 sentences connecting angle to avatar psychology}
```

### Step A3: Present Angles

Show ALL angles. Then say:
"Which angles do you want to develop into scripts? Give me the numbers (e.g., '1, 3, 5'). You can also:"
- **Compare:** "compare 2 vs 5" — side-by-side analysis
- **Regenerate:** "regenerate with more [fear-based / curiosity / social proof] angles"
- **Edit:** "edit angle 3 — make the hook shorter"

### Comparison Mode

When user asks to compare (e.g., "compare 2 vs 5"):

```markdown
## Angle {A} vs Angle {B}

| Dimension | Angle {A}: {name} | Angle {B}: {name} |
|-----------|-------------------|-------------------|
| Avatar | {who} | {who} |
| Awareness | {level} | {level} |
| Emotion | {lever} | {lever} |
| Strength | {advantage} | {advantage} |
| Risk | {weakness} | {weakness} |
| Best For | {when to use} | {when to use} |

**Recommendation:** {which to try first and why}
```

### Step A4: Save Selected Angles

Once user selects:

1. Create `products/{slug}/` if needed
2. Save ALL angles to `products/{slug}/angles.md`:
```markdown
# Ad Angles: {Product Name}
Generated: {YYYY-MM-DD}
Selected for scripts: {comma-separated numbers}

{all angle content}
```
3. Update `flywheel-state.md`

Show: "Angles saved. Want me to write scripts for your selected angles?"

---

## MODE: Scripts — Ad Script Generator

### Step S0: Load Everything (ONE parallel read)

Read ALL in a SINGLE parallel batch:
- `references/script-templates.md`
- `{WORKSPACE}/ad-flywheel/config/playbook.md`
- `{WORKSPACE}/ad-flywheel/config/naming-convention.md` (if exists)
- `{WORKSPACE}/ad-flywheel/products/{slug}/angles.md`
- `{WORKSPACE}/ad-flywheel/products/{slug}/research.md` (if exists)
- `{WORKSPACE}/ad-flywheel/winning-ads/winners-library.md` (if exists)

### Step S1: Identify What to Write

If the user just came from angle selection, use those angles. Otherwise ask: "Which product and angle do you want a script for?"

Then ask: "What length? (15s / 30s / 60s / 90s)" — default 30s.

### Step S2: Generate the Script

Write the full script following timing templates from `references/script-templates.md`.

**Internal generation logic:**
- Open with a hook that stops the scroll in 1 second. Specific to the micro-avatar.
- Agitate the problem using words the avatar actually says. Not marketing speak.
- Introduce the solution through its MECHANISM — what it does and why, not just features.
- Stack proof: testimonials, data, case studies, before/after. Specific = believable.
- Close with clear, low-friction CTA. Remove risk. Create urgency if genuine.

Every spoken line passes the "would a real person say this on camera?" test. Visual direction specific enough for a video editor to execute.

### Output Format

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

**[SOLUTION — 0:XX-0:XX]**
_Visual:_ {visual direction}
_Audio:_ "{exact spoken words}"

**[PROOF — 0:XX-0:XX]**
_Visual:_ {visual direction}
_Audio:_ "{exact spoken words}"

**[CTA — 0:XX-0:XX]**
_Visual:_ {visual direction}
_Audio:_ "{exact spoken words}"

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

### Ad Name
`{name per convention}`
```

### Step S3: Present & Revise

Show full script. Then:
"Want to revise anything?"
- **Edit:** "make the hook more aggressive" / "shorten the problem section"
- **Tone:** "make it more conversational" / "more urgent"
- **Full brief:** "give me the full production brief" (adds thumbnails, format specs, b-roll, music, complexity)
- **Another length:** "also give me a 15s version"
- **Approve:** "looks good" / "save it"

On revision: regenerate ONLY changed sections, keep the rest. Loop until approved.

### Full Production Brief (On Request)

Add after standard brief:
- **Thumbnail Concepts** — 3 options
- **Format Specs** — aspect ratios, resolution, file format
- **B-Roll Suggestions** — specific shots with purpose
- **Music & Sound Direction** — style, tempo, key moments, SFX
- **Production Complexity** — difficulty, shoot time, post needs, assets to prepare

### Step S4: Save Script

Save to `products/{slug}/scripts/{angle-slug}-{length}.md`. Update `flywheel-state.md`.

Show: "Script saved. Generate more scripts, or once ads are running, import performance data to start the flywheel."

---

## MODE: Performance — Import & Flywheel

Detect sub-mode:
- **"import"**, **"metrics"**, **CSV path provided** → Import (below)
- **"flywheel"**, **"winning"**, **"patterns"**, **"best ads"** → Flywheel (further below)
- If unclear, ask: "Do you want to import new performance data, or analyze existing data for winning patterns?"

### IMPORT: Parse & Analyze

#### Step P1: Load Context (ONE parallel read)

Read ALL in a SINGLE parallel batch:
- `{WORKSPACE}/ad-flywheel/config/playbook.md`
- `{WORKSPACE}/ad-flywheel/config/naming-convention.md`

#### Step P2: Get CSV

Ask: "Provide the path to your Meta Ads Manager CSV export."

Read the CSV. Identify columns (handle variations):

| Data Point | Common Column Names |
|-----------|-------------------|
| Campaign | Campaign name, Campaign Name, campaign_name |
| Ad Set | Ad set name, Ad Set Name, adset_name |
| Ad Name | Ad name, Ad Name, ad_name |
| Impressions | Impressions, impressions |
| Clicks | Link clicks, Clicks (all), clicks |
| CTR | CTR (link click-through rate), CTR (all), ctr |
| CPC | CPC (cost per link click), CPC (all), cpc |
| Conversions | Results, Purchases, Leads, conversions |
| ROAS | Purchase ROAS, Website purchase ROAS, roas |
| Spend | Amount spent, Spend, spend |
| CPR | Cost per result, cost_per_result |

If a column can't be matched, ask. Don't guess.

#### Step P3: Parse & Analyze

For each ad, extract all available metrics. Calculate:
- Total spend
- Total conversions
- Weighted average ROAS (total revenue / total spend), simple average CPC, simple average CTR
- Best and worst performers (by ROAS)
- Spend distribution: top 3 vs bottom 3 by spend

#### Step P4: Match to Scripts

If naming convention exists, match ad names to scripts in `products/*/scripts/`. Show matches found.

#### Step P5: Save & Present

1. Save CSV to `products/{slug}/performance/imports/{YYYY-MM-DD}-meta.csv`
2. Generate `products/{slug}/performance/metrics.md`:

```markdown
# Performance Metrics: {Product Name}
Import date: {YYYY-MM-DD}
Data source: {CSV filename}

## Summary
- **Total Spend:** ${amount}
- **Total Conversions:** {count}
- **Average ROAS:** {value}
- **Average CPC:** ${value}
- **Average CTR:** {value}%

## Top Performers (by ROAS)

| Ad Name | ROAS | Spend | Conversions | CPC | CTR |
|---------|------|-------|-------------|-----|-----|
| ... | ... | ... | ... | ... | ... |

## Underperformers

| Ad Name | ROAS | Spend | Conversions | CPC | CTR |
|---------|------|-------|-------------|-----|-----|
| ... | ... | ... | ... | ... | ... |

## All Ads

| Ad Name | ROAS | Spend | Conv | CPC | CTR | Impressions |
|---------|------|-------|------|-----|-----|-------------|
| ... | ... | ... | ... | ... | ... | ... |
```

3. Update `flywheel-state.md`

Show performance summary. Show: "Data imported. Say 'run flywheel' to extract winning patterns."

### FLYWHEEL: Extract Winning Patterns

#### Step F1: Load All Data (ONE parallel read)

Read ALL in a SINGLE parallel batch:
- `{WORKSPACE}/ad-flywheel/config/playbook.md`
- ALL `products/*/performance/metrics.md` files
- ALL `products/*/scripts/*.md`
- ALL `products/*/angles.md`

#### Step F2: Identify Winners

Use playbook performance rules:
- If ROAS target → winners above threshold
- If CPA target → winners below threshold
- If no rules → top 20% by ROAS (or top 3, whichever is more)
- **Minimum:** exclude ads with < 5,000 impressions

#### Step F3: Analyze Patterns

For each winner, identify: angle, hook pattern, emotional lever, awareness level, script length, ad format.

Synthesize across ALL winners:

```markdown
# Winning Ad Patterns
Last updated: {YYYY-MM-DD}
Total ads analyzed: {N}
Winners identified: {M} ({percentage}%)

## Hook Patterns That Win
- {Pattern}: {X}/{M} winners — example: "{hook}"

## Emotional Levers That Win
- {Emotion}: {X}/{M} winners

## Awareness Levels That Win
- Level {N} ({label}): {X}/{M} winners

## Script Structures That Win
- {Framework}: {X}/{M}
- Average winning script length: {Xs}

## Angles That Win
- {Description}: {X}/{M}

## Anti-Patterns (What Loses)
- {Pattern that correlates with poor performance}

## Top 3 Winning Scripts (Full Text)
{actual script text if available}
```

#### Step F4: Save Patterns

Save to `winning-ads/patterns.md`. Update `winning-ads/winners-library.md` with new winners.

#### Step F5: Suggest Playbook Updates

Show suggested updates. Ask: "Which of these do you want to add to your playbook? (all / none / specific numbers)"

ONLY update playbook with approved changes, with date marker:
```markdown
--- Flywheel update: {YYYY-MM-DD} ---
{approved changes}
```

#### Step F6: Feed Forward

Ask: "Which product should these patterns inform next?"
- Specific product → note in dashboard
- "All" → patterns available to all future generation
- Skip → patterns saved but not linked

Update `flywheel-state.md`.

Show: "Flywheel complete. {N} patterns identified. Generate new angles for any product to use these winning patterns."

END.
