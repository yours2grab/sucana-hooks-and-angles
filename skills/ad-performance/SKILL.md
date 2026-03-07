---
name: ad-performance
description: "Ad Flywheel performance tracking and flywheel engine. Imports Meta Ads Manager CSV exports, analyzes performance, identifies winning ads, extracts patterns, and feeds them back into the angle generation cycle. MANDATORY triggers on: ad performance, pull metrics, winning ads, flywheel, import ads, ad metrics, performance data, ad results, winning patterns, run flywheel, analyze ads, ad analytics, best ads. Always use this skill when the user wants to import ad performance data, find winning ads, or run the flywheel to improve future ad generation."
---

# AD PERFORMANCE — Metrics & Flywheel Engine

## Rules

- `{WORKSPACE}` = the directory containing the `ad-flywheel/` folder. Search the current directory. If the current directory IS `ad-flywheel/`, use it directly.
- NEVER modify the playbook without explicit user approval
- Handle CSV column name variations gracefully (Meta exports aren't always consistent)
- When identifying winners, use the agency's own performance rules from playbook
- The flywheel only suggests playbook updates — human approves every change

## Two Modes

Detect which mode based on user intent:
- **"import"**, **"metrics"**, **"performance"**, **CSV path provided** → Mode A (Import)
- **"flywheel"**, **"winning"**, **"patterns"**, **"best ads"** → Mode B (Flywheel)
- If unclear, ask: "Do you want to import new performance data, or analyze existing data for winning patterns?"

---

## MODE A: Import & Analyze

### Step A1: Load Context (ONE parallel read)

Read BOTH files in a single parallel batch:
- `{WORKSPACE}/ad-flywheel/config/playbook.md` — for performance rules
- `{WORKSPACE}/ad-flywheel/config/naming-convention.md` — for ad name matching

### Step A2: Get CSV

Ask: "Provide the path to your Meta Ads Manager CSV export."

Read the CSV file. Identify these columns (handle common variations):

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

If a column can't be matched, ask the user to clarify. Don't guess.

### Step A3: Parse & Analyze

Parse the CSV data. For each ad, extract all available metrics.

Calculate summary stats:
- Total spend
- Total conversions
- Weighted average ROAS (total revenue / total spend), simple average CPC, simple average CTR
- Best performing ad (by ROAS)
- Worst performing ad (by ROAS)
- Spend distribution: top 3 ads by spend vs bottom 3 (no winner/loser labels yet — winner classification happens in Mode B)

### Step A4: Match to Scripts

If naming convention exists, try to match ad names to existing scripts in `products/*/scripts/`.

Show matches found: "Matched {N} ads to existing scripts."

### Step A5: Save & Present

1. Save raw CSV to `products/{slug}/performance/imports/{YYYY-MM-DD}-meta.csv`
   - If product can be identified from campaign/ad names, save under that product
   - If multiple products in one CSV, save under each relevant product
   - If can't determine product, ask the user
2. Generate and save `products/{slug}/performance/metrics.md`:

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
| {name} | {roas} | ${spend} | {conv} | ${cpc} | {ctr}% |
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

3. Update `flywheel-state.md`:
   - Update Perf Data column for this product
   - If enough data exists (10+ ads with metrics), set Next Action to "Run flywheel for pattern analysis"

Show: Performance summary in chat (top 5 performers + overall stats).
Show: "Data imported. Run 'flywheel' or /ad-performance with 'winning ads' to extract patterns."

---

## MODE B: Flywheel — Extract Winning Patterns

### Step B1: Load All Performance Data (ONE parallel read)

Read ALL of these in a SINGLE parallel batch:
- `{WORKSPACE}/ad-flywheel/config/playbook.md` — for performance goals
- ALL `products/*/performance/metrics.md` files
- ALL `products/*/scripts/*.md` — to match winners to scripts (if none exist, that's fine)
- ALL `products/*/angles.md` — to match winners to angles (if none exist, infer from ad names)

### Step B2: Identify Winners

Use the agency's performance rules from playbook to define "winning":
- If playbook specifies ROAS target → winners are ads above that threshold
- If playbook specifies CPA target → winners are ads below that threshold
- If no specific rules → default to top 20% by ROAS (or top 3 ads, whichever is more)
- **Minimum spend filter:** Exclude ads with fewer than 5,000 impressions from winner consideration (not enough data to be meaningful)

List all winning ads with their metrics.

### Step B3: Analyze Winning Patterns

For each winning ad, identify:
- Which angle it came from (if matched)
- Which hook pattern was used
- Which emotional lever was primary
- Which awareness level it targeted
- Script length
- Ad format

Then synthesize patterns across ALL winners:

```markdown
# Winning Ad Patterns

Last updated: {YYYY-MM-DD}
Total ads analyzed: {N}
Winners identified: {M} ({percentage}%)

## Hook Patterns That Win
- {Pattern}: {X}/{M} winners used this — example: "{example hook}"
- {Pattern}: ...

## Emotional Levers That Win
- {Emotion}: {X}/{M} winners
- ...

## Awareness Levels That Win
- Level {N} ({label}): {X}/{M} winners targeted this

## Script Structures That Win
- {Framework}: {X}/{M}
- Average winning script length: {Xs}

## Angles That Win
- {Description of angle type}: {X}/{M}
- ...

## Anti-Patterns (What Loses)
- {Pattern that correlates with poor performance}
- ...

## Top 3 Winning Scripts (Full Text)
{Include the actual script text if available — these are the reference for future generation}
```

### Step B4: Save Patterns

Save to `{WORKSPACE}/ad-flywheel/winning-ads/patterns.md`

Update `{WORKSPACE}/ad-flywheel/winning-ads/winners-library.md` with any new winners:
```markdown
## Winner: {Ad Name}
Product: {product}
ROAS: {value}
Date identified: {YYYY-MM-DD}

### Script
{full script text if available}

### Why It Won
{analysis of what made this ad successful}
```

### Step B5: Suggest Playbook Updates

Based on the patterns found, suggest specific updates to the playbook:

"Based on winning patterns, here are suggested playbook updates:"

1. "{Specific suggestion — e.g., 'Add loss aversion as preferred emotional lever — 5/7 winners used it'}"
2. "{Suggestion}"
3. "{Suggestion}"

## HUMAN LOOP #1: Approve Changes

Show all suggested playbook updates. Ask:
"Which of these do you want to add to your playbook? (all / none / specific numbers)"

ONLY update `config/playbook.md` with approved changes. Add date marker:
```markdown
--- Flywheel update: {YYYY-MM-DD} ---
{approved changes}
```

### Step B6: Feed Forward

Ask: "Which product should these winning patterns inform next? These patterns will be used when generating new angles."

The user can:
- Name a specific product → note it in the dashboard
- Say "all products" → patterns are available to all future angle generation
- Skip → patterns are saved but not explicitly linked

Update `flywheel-state.md`:
- Add flywheel history entry
- Update relevant product Next Actions

Show: "Flywheel complete. {N} patterns identified. Run /ad-angles on any product to generate angles informed by these winning patterns."

END.
