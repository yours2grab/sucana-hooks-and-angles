# How We Built an AI Ad Flywheel That Writes Hooks, Angles, and Scripts in Minutes

## The problem every ad agency has — and the system we built to solve it

Most ad agencies run the same painful cycle. Brainstorm hooks in a meeting. Write scripts in Google Docs. Launch ads. Check metrics in a spreadsheet. Try to remember what worked last time. Repeat.

The knowledge of what actually works lives in people's heads, scattered across Slack threads, and buried in old campaign reports nobody opens. When someone leaves, that knowledge walks out the door.

We built a system that captures winning patterns, feeds them back into the creative process, and generates better ads every cycle. It runs entirely inside Claude Code as a set of skills — no external tools, no SaaS subscriptions, no complex setup. Just markdown files and AI.

This system wouldn't exist without Victor Chazarra. Victor has spent years running paid media at scale — testing thousands of ad variations, killing losers fast, scaling winners methodically. His methodology isn't theory. It's the distilled result of spending real money and watching what actually converts. Every framework in this system — the testing hierarchy, the hook patterns, the micro-avatar approach, the 90% failure reality — comes from Victor's playbook. We didn't invent a new way to write ads. We took what Victor already knew worked and made it repeatable, scalable, and impossible to forget.

Here's exactly how we built it, step by step.

---

## Step 1: Define the Flywheel

Before writing a single line of code, we mapped out the loop every ad goes through:

1. **Research** — understand the product, audience, and competitive landscape
2. **Angles** — generate strategic ad angles with specific hooks
3. **Scripts** — write full production-ready scripts from those angles
4. **Performance** — import real ad data and measure what worked
5. **Patterns** — extract what winners have in common and feed it back into step 2

This is the flywheel. Each rotation makes the next one better. The system gets smarter because it learns from your own data, not generic best practices.

The critical insight: most agencies do steps 1-3 manually and never close the loop back from step 4 to step 2. The winning patterns die in a spreadsheet. Our system makes that feedback loop automatic.

---

## Step 2: Design the Knowledge Architecture

We needed two layers of knowledge:

**Layer 1: Victor's methodology.** This is Victor's direct response advertising framework baked into the generation prompts — his testing hierarchy, hook patterns, emotional triggers, cognitive biases, script structures, and scaling rules. This layer is universal. It doesn't change per agency.

Victor's core principle: angle is king. The message matters more than the hook, and the hook matters more than the format. Most people obsess over production quality when they should be obsessing over what the ad actually says. His testing hierarchy — angle first, then hooks within that angle, then formats within that hook — is hard-wired into how the system generates and evaluates ads.

From Victor's experience, we extracted 7 core hook patterns (Time + Action, Unexpected Truth, Personal Stakes, Contrarian Take, Problem Compression, Numbers + Contrast, Insider Detail). We cataloged the 6 emotional levers he uses most effectively and 10 cognitive biases that drive conversions. We mapped the direct response frameworks he relies on (PAS, BAB, AIDA, Star-Story-Solution, 4 U's) with timing templates for 15s, 30s, 60s, and 90s scripts.

Victor also brought the uncomfortable truth most ad tools ignore: 90% of ads fail. That's not a bug — it's the game. The system is designed around this reality. Instead of trying to write "the perfect ad," it generates diverse angles across different awareness levels and emotional levers, maximizing the odds of finding the 10% that wins. This mindset — volume and diversity over perfection — changed how the entire system works.

All of this lives in small reference files that the AI reads before generating anything. The methodology is embedded in the system, not exposed as a document someone needs to study. Victor's years of testing are baked into every angle the system generates.

**Layer 2: The agency context.** This is everything specific to the agency — their brand, audience, product, voice, performance goals, and accumulated winning patterns. This layer is built during onboarding and grows over time.

The separation matters. Layer 1 gives you a proven framework on day one. Layer 2 makes the system increasingly yours with every ad you run.

---

## Step 3: Build the Onboarding (ad-setup)

The first skill we built handles onboarding. It needs to be fast — under 5 minutes — or agencies won't finish it.

Five questions:
1. What's your brand name?
2. What do you sell?
3. Who's your target audience?
4. How do you define a winning ad? (ROAS target, CPA target, etc.)
5. Do you use a naming convention for ads?

That's it. From these answers, the system generates a playbook file, a brand profile, and a naming convention config. Everything is shown to the user for approval before saving.

But the real power is transcript ingestion. After the questionnaire, the system asks: "Do you have any strategy docs, meeting transcripts, or ad briefs?" Paste them in or point to a file. The AI extracts ad philosophy, audience insights, creative preferences, performance rules, and competitive context — then merges it all into the playbook.

The key design decision: you can run this skill again anytime to add more context. Had a strategy meeting? Paste the transcript. Found a competitor's teardown? Feed it in. The playbook grows without starting over.

---

## Step 4: Build the Angle Generator (ad-angles)

This is the core of the system and where the methodology earns its keep.

When you ask for angles, the system reads three things:
1. Your playbook (agency context)
2. Winning patterns from past ads (if they exist)
3. Product research (if it exists)

Then it generates 5-8 angles. Not headlines. Not taglines. Full strategic briefs.

Each angle includes:
- A **core message** — the one thing this ad communicates
- A **micro-avatar** — not "women 25-45" but "a 34-year-old office worker who bought an Apple Watch 6 months ago and it's been in a drawer since"
- An **awareness level** — where this person sits on the unaware-to-most-aware spectrum
- An **emotional lever** — fear, desire, frustration, curiosity, social proof, or urgency
- A **cognitive bias** — loss aversion, anchoring, social proof, authority, scarcity
- A **DR technique** — PAS, BAB, AIDA, or another framework structuring the ad
- **3 hook variants** — each tagged with which hook pattern it uses
- A **full ad structure outline** — what happens at each timestamp
- A **"Why This Works" rationale** — connecting the angle to the avatar's psychology

The diversity principle is critical here. Most ads fail — roughly 90% of them. The system deliberately generates angles across different awareness levels, different emotions, different avatar types. You're not looking for the perfect angle. You're casting a wide net to find the 10% that wins.

We also built a comparison mode. Ask "compare angle 2 vs 5" and get a side-by-side analysis: strengths, weaknesses, audience fit, and a recommendation based on your goals.

---

## Step 5: Build the Script Writer (ad-scripts)

Once you've selected your angles, the script writer turns them into production-ready scripts.

Each script includes timestamped sections — Hook (0-3s), Problem (3-10s), Solution (10-20s), Proof (20-25s), CTA (25-30s) — with both visual direction and spoken lines for every beat.

The system writes for speaking, not reading. Every line has to sound natural coming out of someone's mouth. It also applies the naming convention automatically, so every script gets a standardized ad name like `FitTrack_AW3_A1_H2_30s_UGC`.

By default, each script comes with a creative brief: shot list, talent notes, setting, tone, and format. Ask for a "full brief" and you get thumbnail concepts, format specs (9:16, 1:1), b-roll suggestions, music direction, and a production complexity estimate.

There's a revision loop built in. Don't like the hook? Ask for three alternatives. Want it shorter? Ask for a 15s version. The system iterates without losing the strategic foundation from the angle.

---

## Step 6: Build the Performance Tracker (ad-performance)

This is where the flywheel closes.

**Mode A: Import.** Export your data from Meta Ads Manager as a CSV. Point the system at it. It parses the columns (handling Meta's inconsistent naming), calculates summary stats — total spend, weighted average ROAS, CPC, CTR — and identifies your top and bottom performers.

It matches ads to existing scripts using the naming convention, so you can trace performance back to specific angles and hooks. Everything gets saved in a structured metrics file.

**Mode B: Flywheel.** This is the magic. The system reads all your performance data across all products, identifies winners based on your own performance goals, and extracts patterns.

What hook patterns do winners share? Which emotional levers convert? What awareness levels perform best? What script lengths work? What formats? And critically — what loses?

These patterns get saved to a patterns file. The system then suggests specific playbook updates: "Add loss aversion as preferred emotional lever — 5 out of 7 winners used it." You approve or reject each suggestion. Nothing changes without your sign-off.

Next time you generate angles, those winning patterns are automatically loaded and weighted heavily. The system doesn't just remember what worked — it actively uses that knowledge to generate better angles.

---

## Step 7: The File System as Database

A deliberate choice: everything is markdown files on your filesystem. No database. No cloud service. No vendor lock-in.

```
ad-flywheel/
  config/
    playbook.md
    brand.md
    naming-convention.md
  products/fittrack-pro/
    research.md
    angles.md
    scripts/
    performance/
  winning-ads/
    winners-library.md
    patterns.md
  flywheel-state.md
```

The dashboard file (`flywheel-state.md`) tracks every product with its current state and a smart next-action suggestion. At a glance, you know which products need research, which have angles ready for scripts, and which have enough performance data to run the flywheel.

Markdown files are version-controllable, readable without special tools, and portable. Your entire ad intelligence travels in a folder you can copy, back up, or share.

---

## What We Learned Building It

**Micro-avatars beat demographics.** This was one of Victor's strongest opinions, and he was right. Telling the AI to write for "women 25-45 interested in fitness" produces generic work. Telling it to write for "a 30-year-old who has downloaded 5 fitness apps and can't stick to a routine because every morning requires a new decision" produces ads that make people stop scrolling. Victor's insistence on specificity — one person, one belief, one pain point — is what makes the angle generator's output actually usable.

**The methodology has to be invisible.** We tried exposing the framework as a readable document. Agencies either ignored it or got overwhelmed. Embedding it into the generation prompts — so it's the default behavior, not homework — made the output dramatically better on day one.

**Human approval is non-negotiable on the flywheel.** Early versions auto-updated the playbook with winning patterns. Bad idea. Sometimes a pattern is a fluke. Sometimes context matters. The system suggests, the human decides.

**Five minutes is the maximum onboarding time.** Every question beyond five drove completion rates down. The transcript ingestion feature compensates — you get depth without length.

**Diversity beats optimization in early cycles.** The instinct is to generate 8 variations of your best-performing angle. The math says cast wide first. You can't optimize what you haven't tested, and most of your assumptions about what works are wrong.

---

## Try It Yourself

The entire system is open source. Clone the repo, run the install script, and start with `/ad-setup` in Claude Code. Five minutes to onboard. Your first angles in under a minute. Your first full script — with creative brief, shot list, and production notes — seconds after that.

The flywheel starts slow. Your first cycle is just generating angles from your context. But by the third or fourth import of real performance data, the system starts surfacing patterns you wouldn't have noticed. By the tenth, it's generating angles that consistently outperform your manual brainstorms.

That's the whole point. Not replacing the creative team — making them faster, more informed, and building on what actually works instead of starting from scratch every time.

The repo is at [github.com/yours2grab/hooks-and-angles](https://github.com/yours2grab/hooks-and-angles). Set it up in 5 minutes. Run your first flywheel cycle. See what it finds.
