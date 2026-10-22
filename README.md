# Hooks & Angles — Ad Flywheel for Claude Code

A Claude Code skill that generates ad hooks, angles, and scripts for any product — then uses winning ad data to continuously improve future output.

Built for ad agencies running Meta ads. Works with any product, any niche.

## How It Works

```
Research → Angles → Scripts → [Run Ads] → Performance → Winning Patterns
   ^                                                          |
   └──────────── flywheel feeds back ─────────────────────────┘
```

1. **Drop your CSV** — Meta Ads Manager export, system bootstraps everything
2. **See what's winning** — instant analysis of your best and worst performers
3. **Generate angles** — 5-8 new ad angles based on what's already working
4. **Write scripts** — full production-ready scripts with visual direction
5. Run the ads on Meta
6. **Import new data** — drop another CSV, system updates and learns
7. **Flywheel** — winning patterns feed back into better angles every cycle

The more you use it, the smarter it gets.

## Install

**Option 1: Download ZIP**
1. Download the ZIP from GitHub and unzip it
2. Open Terminal, `cd` into the unzipped folder
3. Run `bash install.sh`

**Option 2: Git clone**
```bash
git clone https://github.com/yours2grab/hooks-and-angles.git
cd hooks-and-angles
bash install.sh
```

This copies the skill to `~/.claude/skills/`. You can delete the downloaded folder after installing. Requires [Claude Code](https://claude.com/claude-code).

## Quick Start

1. Open Claude Code in any folder (this is where your ad data will live)
2. Type `ad setup` and drop your Meta Ads Manager CSV
3. System extracts your brand, benchmarks, winners, and patterns automatically
4. Type `generate angles` — get 5-8 new angles based on what's already working
5. Type `write script` — pick an angle, get a full production-ready script

That's it. No questionnaire. Your data tells the story.

### What You Can Say

Just type naturally. The skill detects what you need:

| What you want | What to type |
|---------------|-------------|
| Set up / add context | "ad setup", "add context", "ingest this transcript" |
| Research a product | "research [product name]", "product research" |
| Generate angles | "generate angles", "hook ideas", "ad concepts" |
| Write scripts | "write script", "VSL script", "ad copy" |
| Import performance | "import ads", "ad performance", CSV path |
| Run the flywheel | "run flywheel", "winning ads", "best ads" |

No slash commands needed — just describe what you want.

## The Playbook

Every agency gets a `config/playbook.md` that stores their context — brand, audience, goals, and insights extracted from any documents they feed in.

The system ships with a proven ad methodology baked into the generation prompts (testing hierarchy, hook patterns, emotional triggers, script structures, scaling rules). Your playbook layers agency-specific context on top.

Say "add context" anytime to paste new strategy docs, meeting transcripts, or client notes. The more context the system has, the better the angles.

## Directory Structure

After setup, your workspace looks like:

```
ad-flywheel/
├── config/
│   ├── playbook.md              # Your agency context
│   ├── brand.md                 # Brand identity
│   └── naming-convention.md     # Ad naming rules
├── products/{product-slug}/
│   ├── research.md              # Product research
│   ├── angles.md                # Generated angles
│   ├── scripts/                 # Generated scripts
│   └── performance/             # Imported metrics
├── winning-ads/
│   ├── winners-library.md       # Best performing scripts
│   └── patterns.md              # Extracted winning patterns
└── flywheel-state.md            # Dashboard with smart suggestions
```

## Where Does My Data Go?

All your data stays local in the folder where you ran `ad setup`. Nothing is uploaded, shared, or pushed anywhere. The `ad-flywheel/` folder in your working directory contains everything — your playbook, angles, scripts, and performance data.

You can back it up, move it, or version-control it however you want.

## Requirements

- [Claude Code](https://claude.com/claude-code) CLI installed
- A Claude API key (works with Opus or Sonnet)
- macOS or Linux (bash required for install script)

## Credits

Built by [Virgil Brewster](https://github.com/yours2grab). Ad methodology by Victor Chazarra.
