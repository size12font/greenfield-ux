#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="greenfield-ux"

remove_file() {
  local path="$1"
  if [[ -f "${path}" ]]; then
    rm "${path}"
    echo "Removed ${path}"
  fi
}

remove_dir() {
  local path="$1"
  if [[ -d "${path}" ]]; then
    rm -rf "${path}"
    echo "Removed ${path}"
  fi
}

remove_marked_block() {
  local path="$1"
  [[ -f "${path}" ]] || return 0
  python3 - "$path" <<'PYREMOVE'
from pathlib import Path
import re
import sys
p = Path(sys.argv[1])
text = p.read_text(encoding="utf-8")
text = re.sub(r"\n?<!-- GREENFIELD_UX_START -->.*?<!-- GREENFIELD_UX_END -->\n?", "\n", text, flags=re.S)
p.write_text(text.strip() + "\n" if text.strip() else "", encoding="utf-8")
PYREMOVE
  echo "Removed Greenfield UX block from ${path}"
}

remove_file "${HOME}/.claude/commands/${SKILL_NAME}.md"
remove_file "${HOME}/.cursor/commands/${SKILL_NAME}.md"
remove_file "${HOME}/.cursor/rules/${SKILL_NAME}.mdc"
remove_file "${HOME}/.config/opencode/commands/${SKILL_NAME}.md"
remove_file "${HOME}/.config/amp/commands/${SKILL_NAME}.md"
remove_file "${HOME}/.gemini/commands/${SKILL_NAME}.toml"
remove_dir "${HOME}/.gemini/antigravity/global_skills/${SKILL_NAME}"
remove_dir "${HOME}/.codex/skills/${SKILL_NAME}"
remove_marked_block "${HOME}/.codeium/windsurf/memories/global_rules.md"

echo "Greenfield UX uninstall complete."
