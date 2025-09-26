#!/usr/bin/env bash
# scripts/new_session.sh
# Create a new diary session file, auto-incrementing the session number for today's date if not provided.
# Usage:
#   ./scripts/new_session.sh                # create next session for today (start = now)
#   ./scripts/new_session.sh 2              # create session 2 for today (error if exists)
#   ./scripts/new_session.sh 2 09:30        # create session 2 with start 09:30
#   ./scripts/new_session.sh 09:30          # create next session for today but set start=09:30
set -euo pipefail

cd ~/Desktop/MasterThesis2526/the-playground/progress

# --- configuration ---
DIR="diary"
AUTHOR="Pedro Azevedo"

# --- date / defaults ---
DATE=$(date +%F)               # YYYY-MM-DD
DEFAULT_START=$(date +%H:%M)  # current time HH:MM

# --- parse args ---
# We support two calling styles:
#  - ./new_session.sh [SESSION] [START]
#  - ./new_session.sh [START]   (if first arg matches HH:MM, treated as start)
ARG1="${1:-}"
ARG2="${2:-}"

# detect if ARG1 looks like time HH:MM
is_time() {
  [[ "$1" =~ ^([0-1][0-9]|2[0-3]):[0-5][0-9]$ ]]
}

if [ -n "$ARG1" ] && is_time "$ARG1"; then
  # called as: ./new_session.sh 09:30  -> no session provided, start = ARG1
  START_SESSION="$ARG1"
  FORCE_SESSION=""
elif [ -n "$ARG1" ] && ! is_time "$ARG1"; then
  FORCE_SESSION="$ARG1"
  START_SESSION="${ARG2:-$DEFAULT_START}"
else
  FORCE_SESSION=""
  START_SESSION="${ARG2:-$DEFAULT_START}"
fi

# --- ensure diary dir exists ---
mkdir -p "$DIR"

# --- compute session number if not forced ---
SESSION=""
if [ -n "$FORCE_SESSION" ]; then
  SESSION="$FORCE_SESSION"
else
  # enable nullglob so the glob expands to nothing if no files found
  shopt -s nullglob
  files=( "$DIR/${DATE}-s"*.md )
  shopt -u nullglob

  max=0
  for f in "${files[@]:-}"; do
    bn=$(basename "$f")
    # match patterns like YYYY-MM-DD-sN.md
    if [[ "$bn" =~ -s([0-9]+)\.md$ ]]; then
      n=${BASH_REMATCH[1]}
      if (( n > max )); then max=$n; fi
    fi
  done
  SESSION=$((max + 1))
fi

FILE="${DIR}/${DATE}-s${SESSION}.md"

# If forced session and file exists, abort to avoid overwrite
if [ -f "$FILE" ]; then
  echo "Error: file already exists: $FILE"
  exit 1
fi

# --- write template exactly as requested ---
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

echo "Created diary file: $FILE (start=${START_SESSION})"
cp $FILE /home/azevedo/Desktop/MasterThesis2526/123951-thesis-diary/diary

# --- git add / commit / push (best-effort) ---
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git add "$FILE" || true
  if git commit -m "diary: start ${DATE}-s${SESSION} (start ${START_SESSION})" >/dev/null 2>&1; then
    echo "Committed $FILE"
  else
    echo "Warning: git commit failed (check git config or commit hooks)."
  fi
else
  echo "Not in a git repository — skipping git add/commit/push."
fi

# --- try to open the file in IntelliJ IDEA (or fallback) ---
open_in_idea() {
  local f="$1"
  # use IDEA_CMD env var if set
  if [ -n "${IDEA_CMD:-}" ]; then
    if command -v "$IDEA_CMD" >/dev/null 2>&1 || [ -x "$IDEA_CMD" ]; then
      "$IDEA_CMD" "$f" >/dev/null 2>&1 & disown || true
      return 0
    fi
  fi

  if command -v intellij-idea-ultimate >/dev/null 2>&1; then
    idea "$f" >/dev/null 2>&1 & disown || true
    return 0
  fi

  # generic open
  if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$f" >/dev/null 2>&1 & disown || true
    return 0
  fi

  return 1
}

if open_in_idea "$FILE"; then
  echo "Opened $FILE in IntelliJ (or fallback editor)."
else
  echo "Could not open IntelliJ automatically. To open manually run:"
  echo "  idea $FILE   # if you have the 'idea' launcher"
  echo "  code -g $FILE"
fi

exit 0
