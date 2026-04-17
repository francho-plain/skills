#!/bin/bash
# Detects if a security audit is needed after clone or pull.
# Called by the SessionStart hook. Outputs JSON for VS Code Copilot.

set -euo pipefail

# Skip if not a git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo '{}'
  exit 0
fi

MARKER_FILE=".git/copilot-security-audit"
CURRENT_HEAD=$(git rev-parse HEAD 2>/dev/null || true)

if [ -z "$CURRENT_HEAD" ]; then
  echo '{}'
  exit 0
fi

# No marker → fresh clone or first audit
if [ ! -f "$MARKER_FILE" ]; then
  cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "SECURITY AUDIT NEEDED: This appears to be a freshly cloned repository (no previous audit record found). Before starting any work, run a full security audit using the security-audit skill. Delegate to the Code Cop agent to analyze the entire repository."
  }
}
EOF
  exit 0
fi

LAST_AUDITED=$(cat "$MARKER_FILE" 2>/dev/null || true)

# HEAD matches last audit → nothing to do
if [ "$CURRENT_HEAD" = "$LAST_AUDITED" ]; then
  echo '{}'
  exit 0
fi

# Verify the stored commit still exists (handles force-push / rebase)
if ! git cat-file -e "$LAST_AUDITED" 2>/dev/null; then
  cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "SECURITY AUDIT NEEDED: The previously audited commit is no longer reachable (possible force-push or rebase). Run a full security audit using the security-audit skill. Delegate to the Code Cop agent to analyze the entire repository."
  }
}
EOF
  exit 0
fi

# New changes detected — list changed files (cap at 100 for context size)
CHANGED_FILES=$(git diff --name-only "$LAST_AUDITED" "$CURRENT_HEAD" 2>/dev/null | head -100)

if [ -z "$CHANGED_FILES" ]; then
  echo '{}'
  exit 0
fi

# Build a comma-separated list safe for JSON embedding
FILE_LIST=$(echo "$CHANGED_FILES" | sed 's/"/\\"/g' | paste -sd ',' -)

cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "SECURITY AUDIT NEEDED: New changes detected since last audit (${LAST_AUDITED:0:8}..${CURRENT_HEAD:0:8}). Run a targeted security audit using the security-audit skill. Delegate to the Code Cop agent to review ONLY these changed files: ${FILE_LIST}"
  }
}
EOF
exit 0
