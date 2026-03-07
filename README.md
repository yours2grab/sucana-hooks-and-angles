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

```bash
git clone <repo-url> ad-flywheel
cd ad-flywheel
chmod +x install.sh
./install.sh
```

This symlinks all skills to `~/.claude/skills/`. Requires [Claude Code](https://claude.com/claude-code).

## Quick Start

```
/ad-setup          # One-time setup (~5 min questionnaire)
/ad-research       # Research a product
/ad-angles         # Generate hooks and angles
/ad-scripts        # Write scripts from selected angles
/ad-performance    # Import Meta data + run the flywheel
```

### Fastest path (skip research):
```
/ad-setup          # Setup
/ad-angles         # Describe your product, get angles immediately
/ad-scripts        # Pick an angle, get a script
```

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

## Requirements

- [Claude Code](https://claude.com/claude-code) CLI
- Claude API access (Opus or Sonnet)
