#!/bin/bash

# Check for uncommitted changes
if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

# Add all changes (including untracked files)
git add .

# Commit with a timestamped message
git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to current branch
git push

# Show status after push
git status
