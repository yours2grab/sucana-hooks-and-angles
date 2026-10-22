#!/bin/bash
# Hooks & Angles — Install Script
# Copies the skill to ~/.claude/skills/

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"
SKILL_NAME="hooks-and-angles"

mkdir -p "$SKILLS_DIR"

# Remove old individual skills if they exist (from previous versions)
for old_skill in ad-setup ad-angles ad-scripts ad-research ad-performance; do
  old_target="$SKILLS_DIR/$old_skill"
  if [ -L "$old_target" ] || [ -d "$old_target" ]; then
    rm -rf "$old_target"
    echo "Removed old skill: $old_skill"
  fi
done

# Install the unified skill
target="$SKILLS_DIR/$SKILL_NAME"
if [ -L "$target" ] || [ -d "$target" ]; then
  rm -rf "$target"
fi

cp -r "$SCRIPT_DIR/skills/$SKILL_NAME" "$target"
echo "Installed: $SKILL_NAME"

echo ""
echo "Hooks & Angles installed."
echo ""
echo "Open Claude Code in any directory and type 'ad setup' to get started."
