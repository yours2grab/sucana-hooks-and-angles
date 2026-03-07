---
name: ad-research
description: "Ad Flywheel product and market research. Deep-dives into a product, its audience, competitors, and emotional landscape to fuel angle generation. MANDATORY triggers on: research product, new product, ad research, product research, research audience, market research, product deep dive, audience research, competitor analysis. Always use this skill when the user wants to research a product or market before generating ad angles."
---

# AD RESEARCH — Product & Market Deep Dive

## Rules

- All paths use `{WORKSPACE}` as shorthand for the ad-flywheel working directory
- Use WebSearch for product details, competitors, and market data
- Research must be ACTIONABLE for ad creation — not a general market report
- Focus on emotional triggers, objections, and language the audience actually uses
- Every section should help write better ads, not just inform

## Step 0: Load Context

1. Read `{WORKSPACE}/ad-flywheel/config/playbook.md` — agency context
2. Read `{WORKSPACE}/ad-flywheel/config/brand.md` — brand identity

## Step 1: Identify the Product

Ask: "What product do you want to research?"

Accept:
- Product name + brief description
- URL to product page
- Detailed product info

If they provide a URL, use WebFetch to pull product details.

Create the product slug: `{product-name}` → `product-name`

## Step 2: Research

Use WebSearch to gather information across these dimensions:

**A) Product Details**
- What it does, how it works (the mechanism)
- Price point and positioning
- Key features and unique value proposition
- What makes it different from alternatives

**B) Target Audience**
- Who buys this type of product
- Demographics AND psychographics
- Where they hang out online (forums, social, communities)
- Language they use to describe their problems

**C) Competitive Landscape**
- Top 3-5 direct competitors
- How competitors position themselves
- Gaps in competitor messaging
- Price comparisons

**D) Customer Sentiment**
Search for reviews, Reddit threads, forum discussions about this product or category:
- What do buyers love?
- What do they complain about?
- What objections come up before purchase?
- What language do they use?

## Step 3: Synthesize into Research Document

Generate `research.md` with this structure:

```markdown
# Product Research: {Product Name}
Date: {YYYY-MM-DD}
Source: WebSearch + {any user-provided context}

---

## Product Overview
**What it is:** {1-2 sentences}
**Mechanism:** {How it works — the unique method or technology}
**Price:** {price point or range}
**Unique Value:** {What makes it different — the thing competitors can't claim}

## Target Audience

### Primary ICP
**Demographics:** {age, gender, income, location patterns}
**Psychographics:** {values, lifestyle, beliefs, identity}
**Pain Points:** {specific problems they experience — use THEIR language}
**Desires:** {what they want — the outcome, not the product}

### 5 Awareness Levels
**Level 1 — Unaware:** {What they think/believe. They don't know they have this problem.}
**Language:** "{example of what they say}"

**Level 2 — Problem Aware:** {They know the problem but not the solution.}
**Language:** "{example of what they say}"

**Level 3 — Solution Aware:** {They know solutions exist but not THIS one.}
**Language:** "{example of what they say}"

**Level 4 — Product Aware:** {They know THIS product but aren't convinced.}
**Language:** "{example of what they say}"

**Level 5 — Most Aware:** {They know the product, believe it works, just need the push.}
**Language:** "{example of what they say}"

### Micro-Avatar Seeds
{3-5 specific micro-avatars within the target audience. Each with: who they are, what they believe, what they fear, what they want, their main objection}

## Competitive Landscape

| Competitor | Positioning | Price | Strength | Weakness |
|-----------|------------|-------|----------|----------|
| {name} | {how they position} | {price} | {advantage} | {gap we can exploit} |
| ... | ... | ... | ... | ... |

**Messaging Gaps:** {What competitors aren't saying that we can claim}

## Emotional Landscape

### Triggers That Drive Action
1. **{Emotion}:** {How it manifests for this audience + example language}
2. **{Emotion}:** ...

### Top Objections
1. **"{Objection in their words}"** → Counter: {how to overcome it}
2. **"{Objection}"** → Counter: {how to overcome it}
...up to 7

## Proof Elements
{What evidence exists? Testimonials, studies, data points, case studies, certifications, press mentions}

## Ad Angle Seeds
{Based on this research, here are 3-5 promising angle directions to explore in /ad-angles:}
1. {Angle direction + which avatar + which emotion}
2. ...
```

## HUMAN LOOP #1: Review Research

Show the full research document in chat.

Ask: "Here's the research. Want to correct anything, add context, or save as-is?"

Accept corrections (the user knows their product better than web results). Apply edits.

## Step 4: Save

1. Create `{WORKSPACE}/ad-flywheel/products/{slug}/` if it doesn't exist
2. Save to `products/{slug}/research.md`
3. Update `flywheel-state.md` dashboard:
   - Add or update product row
   - Set Research to "done"
   - Set Next Action to "Generate angles next"

Show: "Research saved. Run /ad-angles to generate angles based on this research."

END.
