#!/bin/bash
# Ad Flywheel — Install Script
# Symlinks all skills to ~/.claude/skills/

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

mkdir -p "$SKILLS_DIR"

for skill_dir in "$SCRIPT_DIR"/skills/*/; do
  skill_name=$(basename "$skill_dir")
  target="$SKILLS_DIR/$skill_name"

  if [ -L "$target" ]; then
    rm "$target"
  fi

  ln -s "$skill_dir" "$target"
  echo "Linked: $skill_name -> $target"
done

echo ""
echo "Ad Flywheel skills installed. Available commands:"
echo "  /ad-setup        — Onboard a new agency or add context"
echo "  /ad-angles       — Generate hooks and angles for a product"
echo "  /ad-scripts      — Write ad scripts from selected angles"
echo "  /ad-research     — Deep product and market research"
echo "  /ad-performance  — Import Meta data and run the flywheel"
