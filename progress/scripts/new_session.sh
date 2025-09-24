#!/usr/bin/env bash
# scripts/new_session.sh
# Create a new diary session file with the exact template requested.
# Usage:
#   ./scripts/new_session.sh            # session 1, start = current time
#   ./scripts/new_session.sh 2          # session 2, start = current time
#   ./scripts/new_session.sh 2 09:30    # session 2, start = 09:30 (optional)
set -euo pipefail

DATE=$(date +%F)               # YYYY-MM-DD
DEFAULT_START=$(date +%H:%M)   # current time HH:MM
SESSION="${1:-1}"              # optional first arg = session number (default 1)
START_SESSION="${2:-$DEFAULT_START}"  # optional second arg = start time override
DIR="diary"
FILE="${DIR}/${DATE}-s${SESSION}.md"
AUTHOR="Pedro Azevedo"

# Make diary dir
mkdir -p "$DIR"

# Avoid overwriting existing file
if [ -f "$FILE" ]; then
  echo "Error: File already exists: $FILE"
  exit 1
fi

# Create the file with the exact template content (variables expanded)
cat > "$FILE" <<EOF
---
id: ${DATE}-s${SESSION}
date: ${DATE}
start: ${START_SESSION}
end:
duration_hours:
sprint:
tags: []
author: ${AUTHOR}
---

# Diary — ${DATE} (Session ${SESSION})

## Tasks completed
- [ ]

## Tasks to do (next session)
- [ ]

## Artifacts / Links
- Commit:
- Prototype:

## Blockers / Notes
-

**Quick notes:**
EOF

echo "Created diary file: $FILE"

# If inside a git repository, add, commit and attempt to push (if upstream exists)
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git add "$FILE"
  if git commit -m "diary: start ${DATE}-s${SESSION} (start ${START_SESSION})" >/dev/null 2>&1; then
    echo "Committed $FILE"
  else
    echo "Warning: git commit failed (check git config or commit hooks)."
  fi

  # push if the current branch has an upstream set
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  if git rev-parse --symbolic-full-name --abbrev-ref @{u} >/dev/null 2>&1; then
    echo "Pushing to remote..."
    if git push; then
      echo "Pushed to remote."
    else
      echo "Push failed. Check remote/auth."
    fi
  else
    echo "No upstream set for branch '$CURRENT_BRANCH'. To push manually run:"
    echo "  git push -u origin $CURRENT_BRANCH"
  fi
else
  echo "Not a git repository. Skipping git add/commit/push."
  echo "Initialize git with: git init && git remote add origin <url>  (if desired)"
fi

# Optionally open the file in the default editor if $EDITOR is set
if [ -n "${EDITOR:-}" ]; then
  if command -v "$EDITOR" >/dev/null 2>&1; then
    "$EDITOR" "$FILE" &
  fi
fi

exit 0
