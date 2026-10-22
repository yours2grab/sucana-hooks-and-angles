# Script Templates Reference

## Output Format for All Scripts

Every generated script follows this exact structure:

```markdown
# Script: {Angle Name} — {Length}
Product: {product name}
Angle: {angle number from angles.md}
Length: {15s / 30s / 60s / 90s}
Generated: {YYYY-MM-DD}

---

## The Script

**[HOOK — 0:00-0:XX]**
_Visual:_ {what the viewer sees — camera angle, setting, text overlay}
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
1. {Scene 1}: {camera, framing, movement, talent action}
2. {Scene 2}: ...

### Production Notes
- **Talent:** {type — UGC creator, founder, actor, voiceover only}
- **Setting:** {environment — home, office, studio, outdoor}
- **Tone:** {energy level + mood — urgent, conversational, authoritative}
- **Format:** {UGC selfie / talking head / b-roll heavy / screen recording}
- **Text Overlays:** {key text that appears on screen}

### Naming Convention
`{convention from config or generated}`
```

## Timing Templates by Length

### 15-Second Script
| Section | Time | Words (~) |
|---------|------|-----------|
| Hook | 0:00-0:02 | 5-8 |
| Problem | 0:02-0:06 | 10-15 |
| Solution | 0:06-0:11 | 12-18 |
| CTA | 0:11-0:15 | 8-12 |

Total: ~35-53 words. Every word must earn its place.

### 30-Second Script
| Section | Time | Words (~) |
|---------|------|-----------|
| Hook | 0:00-0:03 | 8-12 |
| Problem | 0:03-0:10 | 18-25 |
| Solution | 0:10-0:20 | 25-35 |
| Proof | 0:20-0:25 | 12-18 |
| CTA | 0:25-0:30 | 10-15 |

Total: ~73-105 words.

### 60-Second Script
| Section | Time | Words (~) |
|---------|------|-----------|
| Hook | 0:00-0:03 | 8-12 |
| Problem | 0:03-0:15 | 30-40 |
| Credibility | 0:15-0:25 | 25-30 |
| Solution | 0:25-0:40 | 35-45 |
| Proof | 0:40-0:52 | 28-35 |
| CTA | 0:52-0:60 | 15-20 |

Total: ~141-182 words.

### 90-Second Script
| Section | Time | Words (~) |
|---------|------|-----------|
| Hook | 0:00-0:03 | 8-12 |
| Problem | 0:03-0:18 | 38-50 |
| Credibility | 0:18-0:28 | 25-30 |
| Solution | 0:28-0:48 | 48-60 |
| Proof | 0:48-1:10 | 50-65 |
| CTA | 1:10-1:30 | 25-35 |

Total: ~194-252 words.

## Full Production Brief (Extended Format)

When the user requests a "full brief", add these sections after the standard creative brief:

```markdown
### Thumbnail Concepts
1. {Concept A}: {description — key visual, text, emotion}
2. {Concept B}: {description}
3. {Concept C}: {description}

### Format Specs
- **Aspect Ratios:** {9:16 (Stories/Reels), 1:1 (Feed), 4:5 (Feed optimized)}
- **Resolution:** 1080x1920 (9:16) / 1080x1080 (1:1) / 1080x1350 (4:5)
- **File Format:** MP4, H.264
- **Max File Size:** 4GB (Meta)

### B-Roll Suggestions
1. {Shot description + purpose}
2. {Shot description + purpose}
3. {Shot description + purpose}

### Music & Sound Direction
- **Style:** {genre, tempo, mood}
- **Key moments:** {where music changes — builds, drops, cuts}
- **Sound effects:** {specific SFX and where they go}

### Production Complexity
- **Difficulty:** {Low / Medium / High}
- **Estimated shoot time:** {X hours}
- **Post-production:** {editing complexity — cuts only / motion graphics / color grading}
- **Assets needed:** {list of things to prepare before shoot}
```
