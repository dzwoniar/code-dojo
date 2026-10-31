#!/usr/bin/env bash
set -euo pipefail
SCRIPT_HOME="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
CODE_DOJO_HOME="${CODE_DOJO_HOME:-$SCRIPT_HOME}"
CODEX_BIN="${CODEX_BIN:-codex}"
TODAY_FILE="$CODE_DOJO_HOME/today.md"
[ -f "$TODAY_FILE" ] || { echo "Copy today.example.md to today.md and write an exercise first."; exit 1; }
command -v "$CODEX_BIN" >/dev/null 2>&1 || { echo "Configure CODEX_BIN for your installation."; exit 1; }
git rev-parse --show-toplevel >/dev/null 2>&1 || { echo "Run from your exercise repository."; exit 1; }
BRANCH="$(git branch --show-current)"
if [ "$BRANCH" = main ] || [ "$BRANCH" = master ]; then
  echo "Create a separate exercise branch first."; exit 1
fi
{ printf '%s\n\n' 'Learning session: explain before editing; keep changes inside the exercise; do not publish or commit automatically.'; cat "$TODAY_FILE"; } |
  "$CODEX_BIN" exec -C "$(pwd)" --add-dir "$CODE_DOJO_HOME" -s workspace-write -
echo "Review the diff and write your private journal entry. Nothing is committed automatically."
