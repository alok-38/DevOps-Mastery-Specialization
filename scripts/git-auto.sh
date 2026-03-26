#!/bin/bash

# Show git status
echo "Current Git status:"
git status

# Ask if user wants to include untracked files
read -p "Do you want to include untracked files? (y/N): " include_untracked

if [[ "$include_untracked" =~ ^[Yy]$ ]]; then
    git add -A
else
    git add -u
fi

# Show staged changes
echo -e "\nStaged changes:"
git diff --cached --name-status

# Ask for commit message
read -p "Enter commit message: " commit_msg

# Commit
git commit -m "$commit_msg"

# Ask for confirmation before pushing
read -p "Push to remote? (y/N): " push_confirm
if [[ "$push_confirm" =~ ^[Yy]$ ]]; then
    git push
else
    echo "Push skipped."
fi

# Show final status
echo -e "\nFinal Git status:"
git status
