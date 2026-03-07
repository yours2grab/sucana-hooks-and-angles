---
name: ad-setup
description: "Ad Flywheel onboarding and context enrichment. Sets up the workspace, builds the agency playbook, and ingests transcripts or strategy docs. MANDATORY triggers on: ad setup, setup ad flywheel, onboard agency, ad onboarding, add context, ingest transcript, ingest doc, ad config, setup flywheel, configure ads. Run this skill whenever the user wants to set up a new ad flywheel workspace OR add new context (transcripts, docs, strategy notes) to an existing one."
---

# AD SETUP — Onboarding & Context Enrichment

## Rules

- `{WORKSPACE}` = the current working directory. The `ad-flywheel/` folder is created inside it.
- IMPORTANT: If the current directory is already named `ad-flywheel/`, do NOT nest another `ad-flywheel/` inside it. Use the current directory as the workspace root directly.
- On FIRST RUN: create directory structure, run questionnaire, ingest docs, show config for approval, then save
- On SUBSEQUENT RUNS: detect existing config, offer context enrichment mode
- NEVER overwrite existing playbook — always APPEND new context
- Generate all config content in memory first. Show to user for review. Only write files AFTER user approves.

## Step 0: Detect Existing Setup

Check if the current directory IS `ad-flywheel/` (contains `config/` subdirectory or is named `ad-flywheel`). If so, use it as the workspace root — do NOT create a nested `ad-flywheel/` inside it.

Otherwise, search for an existing `ad-flywheel/config/playbook.md` — first check current directory, then `~/ad-flywheel/`, `~/Program/ad-flywheel/`.

- **If NO config exists** → ask: "Where do you want the ad-flywheel workspace? Default: current directory." Then proceed to Step 1.
- **If config exists** → set `{WORKSPACE}` to the parent of the found `ad-flywheel/` dir. Skip to Step 5 (Context Enrichment Mode).

## Step 1: Create Directory Structure

Create the full ad-flywheel directory tree:

```
{WORKSPACE}/ad-flywheel/
├── config/
│   ├── playbook.md
│   ├── brand.md
│   └── naming-convention.md
├── products/
├── winning-ads/
│   ├── winners-library.md
│   └── patterns.md
└── flywheel-state.md
```

Initialize `flywheel-state.md` with empty dashboard:

```markdown
# Ad Flywheel Dashboard

## Products

| Product | Research | Angles | Scripts | Perf Data | Next Action |
|---------|----------|--------|---------|-----------|-------------|

## Flywheel History

| Date | Patterns Found | Fed Into | Approved |
|------|---------------|----------|----------|
```

Initialize empty placeholder files:
- `winning-ads/winners-library.md` — with header `# Winning Ads Library` and empty content
- `winning-ads/patterns.md` — with header `# Winning Ad Patterns` and empty content

## Step 2: Quick Questionnaire (~5 min)

Ask these 5 questions. Accept short answers — even one sentence is fine:

1. **Brand/company name?** — "What's your brand or company name?"
2. **What do you sell?** — "What product or service do you sell? Just a brief description."
3. **Target audience?** — "Who's your target audience? Even one sentence is fine."
4. **Definition of winning?** — "What's your ROAS goal, or how do you define a winning ad? (e.g., ROAS > 3, CPA under $20)"
5. **Naming convention?** — "Do you use a naming convention for your ads? If so, describe it. If not, type 'skip' and we'll generate one later."

Store answers for playbook generation.

## Step 3: Transcript & Document Ingestion

Ask: "Do you have any strategy docs, meeting transcripts, ad briefs, or notes you'd like to feed in? Paste the text or provide file paths. Type 'skip' if you don't have any right now — you can always add more later by running /ad-setup again."

**If user provides content:**

Read the provided text or files. Extract the following and organize by category:

- **Ad philosophy:** How they think about ads, testing, creative, what matters most
- **Audience insights:** Who they target, language they use, segments, personas
- **Creative preferences:** Ad formats they prefer, tone, visual style, what's worked before
- **Performance rules:** How they judge ad success, kill criteria, scaling approach
- **Competitive context:** Who they compete with, how they differentiate

Format extracted insights clearly with source attribution:
```markdown
### [Category]
- [Insight] _(Source: [filename or "pasted transcript"])_
```

**If user provides winning ad examples:**

Save to `winning-ads/winners-library.md`:
```markdown
## Winning Ad: {name or description}
Source: {provided by user during onboarding}
Date added: {YYYY-MM-DD}

### Script/Copy
{the ad text or script}

### Why It Worked (if stated)
{any context the user provided about why this performed well}
```

## Step 4: Generate Config Files

### playbook.md

Generate `config/playbook.md` combining questionnaire answers + extracted transcript insights:

```markdown
# Agency Playbook

## Brand
{brand name}

## Product/Service
{what they sell — from questionnaire}

## Target Audience
{audience description — from questionnaire + transcript insights}

## Performance Goals
{ROAS target, CPA target, definition of winning — from questionnaire}

## Extracted Insights

### Ad Philosophy
{extracted from transcripts/docs, or "No documents ingested yet — run /ad-setup to add context"}

### Audience Insights
{extracted}

### Creative Preferences
{extracted}

### Performance Rules
{extracted}

### Competitive Context
{extracted}

---
_Last updated: {YYYY-MM-DD}_
_Context sources: {list of ingested files/transcripts}_
```

### brand.md

Generate `config/brand.md`:
```markdown
# Brand Profile

## Name
{brand name}

## Product/Service
{description}

## Voice & Tone
{extracted from docs, or "Not yet defined — will be refined as ads are created"}

## Key Differentiators
{extracted, or "To be identified during product research"}
```

### naming-convention.md (if provided)

If user described a naming convention, save to `config/naming-convention.md`:
```markdown
# Ad Naming Convention

## Format
{their described convention}

## Examples
{generate 2-3 examples based on their format}
```

If user skipped, create a default using the actual brand/product name from the questionnaire:
```markdown
# Ad Naming Convention

## Format
`{Product}_{AwarenessLevel}_{Angle#}_{Hook#}_{Length}_{Format}`

## Examples
- `{BrandProduct}_AW3_A1_H2_30s_UGC`
- `{BrandProduct}_AW2_A3_H1_60s_TalkingHead`

_This is a default convention. Edit this file to customize._
```

Replace `{BrandProduct}` with an abbreviated version of the actual product name from Q2 (e.g., "Advanced Skin Serum" → `SkinSerum`).

## HUMAN LOOP #1: Review Config

Show the user:
1. The generated `playbook.md` content
2. The generated `brand.md` content
3. The naming convention

Ask: "Here's your initial setup. Want to edit anything before I save?"

Apply any edits, then save all config files.

Show: "Setup complete. Your ad flywheel is ready."
Show: "Next steps: Run /ad-research to research a product, or /ad-angles to generate angles directly."

---

## Step 5: Context Enrichment Mode (Subsequent Runs)

When config already exists:

Show: "Existing playbook found. Would you like to add more context?"

Accept new transcripts, docs, or notes from the user. Process them using the same extraction logic from Step 3.

**Append** extracted insights to existing `config/playbook.md` under the relevant sections. Add a date marker:

```markdown
--- Added from: {source name} ({YYYY-MM-DD}) ---
```

Show what was added. Ask for approval before saving.

Show updated playbook sections that changed.

END.
