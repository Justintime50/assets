#!/bin/bash

# Use this tool to clean a repo of its `assets` directory through its entire git history.
# This is important because even if a file is removed, it remains in git history and continues using up disk space.
# Assumes you have `git-filter-repo` installed already: `brew install git-filter-repo`
# Usage: ./asset-cleaner.sh my-repo-name

USERNAME="Justintime50"
FRESH_GIT_REPOS_PATH="$HOME/git/playground/assets"

main() {
    cd "$FRESH_GIT_REPOS_PATH"
    git clone https://github.com/"$USERNAME"/"$1".git
    cd "$1"
    echo "Removing 'assets' directory for $(pwd)"
    git filter-repo --invert-paths --path assets/
    git remote add origin https://github.com/"$USERNAME"/"$1"
    git push origin --force --all
    cd
    echo "Script complete, inspect the repo for removed assets."
}

main "$1"
