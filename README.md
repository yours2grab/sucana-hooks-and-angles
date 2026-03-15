# Ad Flywheel — Hook & Angle Generator

A Claude Code skill pack that generates ad hooks, angles, and scripts for any product — then uses winning ad data to continuously improve future output.

Built for ad agencies running Meta ads. Works with any product, any niche.

## How It Works

```
Research → Angles → Scripts → [Run Ads] → Performance → Winning Patterns
   ^                                                          |
   └──────────── flywheel feeds back ─────────────────────────┘
```

1. **Research** a product (audience, competitors, emotional landscape)
2. **Generate angles** (5-8 per product with hooks, emotional triggers, cognitive biases)
3. **Write scripts** (timestamped VSL scripts with creative briefs)
4. Run the ads on Meta
5. **Import performance data** (CSV from Meta Ads Manager)
6. **Extract winning patterns** (what hooks, emotions, structures win)
7. Winning patterns automatically inform the next round of angle generation

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

This copies all skills to `~/.claude/skills/`. You can delete the downloaded folder after installing — the skills are already copied. Requires [Claude Code](https://claude.com/claude-code).

## Quick Start

1. Open Claude Code in any folder (this is where your ad data will live)
2. Type `ad setup` — answer 5 quick questions about your brand
3. Type `ad angles` — get 5-8 ad angles with hooks for your product
4. Type `ad scripts` — pick an angle, get a full production-ready script

That's it. You're generating ads.

### All Commands

| Command | What to type | What happens |
|---------|-------------|-------------|
| Setup | "ad setup" | 5-min onboarding questionnaire |
| Research | "ad research" | Deep product/market research |
| Angles | "ad angles" or "generate angles" | 5-8 angles with hooks |
| Scripts | "ad scripts" or "write script" | Full timestamped scripts |
| Performance | "ad performance" or "import ads" | Import CSV + run flywheel |

You don't need to use slash commands — just type the trigger phrase naturally (e.g., "generate angles for my protein powder").

## Skills

| Skill | What It Does |
|-------|-------------|
| `ad-setup` | Onboards your agency. Quick questionnaire + paste any strategy docs or transcripts. Run again anytime to add more context. |
| `ad-angles` | Generates 5-8 ad angles per product with hooks, emotional triggers, cognitive biases, and script structures. Includes angle comparison mode. |
| `ad-scripts` | Writes full timestamped ad scripts (15s/30s/60s/90s) with visual direction and creative briefs. Human review loop for iteration. |
| `ad-research` | Deep product research — audience, competitors, objections, emotional triggers, awareness levels. |
| `ad-performance` | Imports Meta CSV exports, identifies winners, extracts patterns, and feeds them back into angle generation. |

## The Playbook

Every agency gets a `config/playbook.md` that stores their context — brand, audience, goals, and insights extracted from any documents they feed in.

The system ships with a proven ad methodology baked into the generation prompts (testing hierarchy, hook patterns, emotional triggers, script structures, scaling rules). Your playbook layers agency-specific context on top.

### Adding Context Over Time

Run `/ad-setup` again anytime to:
- Paste new strategy docs or meeting transcripts
- Add insights from client calls
- Update your goals or audience definition

The more context the system has, the better the angles.

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

## Examples

See the `examples/` directory for:
- `sample-playbook.md` — Example filled-out playbook
- `sample-csv/` — Example Meta Ads Manager export for testing

## Where Does My Data Go?

All your data stays local in the folder where you ran `ad setup`. Nothing is uploaded, shared, or pushed anywhere. The `ad-flywheel/` folder in your working directory contains everything — your playbook, angles, scripts, and performance data.

You can back it up, move it, or version-control it however you want.

## Requirements

- [Claude Code](https://claude.com/claude-code) CLI installed
- A Claude API key (works with Opus or Sonnet)
- macOS or Linux (bash required for install script)

## Credits

Built by Virgil Brewster and Victor Chasaraz at [Sucana](https://sucana.ai) — AI-powered ad creative for B2B SaaS.

---

## The Lead — AI Workflows for Marketers

Every Friday, one real AI workflow from inside our build. No theory. No hype. Just what worked, what flopped, and what we'd do differently.

[Join The Lead →](https://sucana.ai/newsletter)

Built by [Virgil Brewster](https://www.linkedin.com/in/virgilbrewster/) at [Sucana](https://sucana.ai)