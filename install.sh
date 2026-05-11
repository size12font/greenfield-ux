#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="greenfield-ux"
DISPLAY_NAME="Greenfield UX"

DEFAULT_RAW_BASE="https://raw.githubusercontent.com/size12font/greenfield-ux/main"
RAW_BASE="${GREENFIELD_UX_RAW_BASE:-$DEFAULT_RAW_BASE}"
TMP_DIR=""
SCRIPT_DIR=""

log() { printf "\033[1;32m%s\033[0m\n" "$1"; }
warn() { printf "\033[1;33m%s\033[0m\n" "$1"; }
err() { printf "\033[1;31m%s\033[0m\n" "$1" >&2; }

cleanup() {
  if [[ -n "${TMP_DIR}" && -d "${TMP_DIR}" ]]; then
    rm -rf "${TMP_DIR}"
  fi
}
trap cleanup EXIT

require_cmd() {
  local cmd="$1"
  if ! command -v "${cmd}" >/dev/null 2>&1; then
    err "Missing required command: ${cmd}"
    exit 1
  fi
}

detect_script_dir() {
  local source="${BASH_SOURCE[0]:-}"
  if [[ -n "${source}" && -f "${source}" ]]; then
    cd "$(dirname "${source}")" && pwd
  fi
}

fetch_file() {
  local path="$1"
  local dest="$2"

  if [[ -n "${SCRIPT_DIR}" && -f "${SCRIPT_DIR}/${path}" ]]; then
    cp "${SCRIPT_DIR}/${path}" "${dest}"
    return 0
  fi

  if [[ -f "${path}" ]]; then
    cp "${path}" "${dest}"
    return 0
  fi

  require_cmd curl
  curl -fsSL "${RAW_BASE}/${path}" -o "${dest}"
}

copy_file() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "${dest}")"
  cp "${src}" "${dest}"
  log "Installed ${DISPLAY_NAME}: ${dest}"
}

append_marked_block() {
  local src="$1"
  local dest="$2"
  local start="<!-- GREENFIELD_UX_START -->"
  local end="<!-- GREENFIELD_UX_END -->"
  mkdir -p "$(dirname "${dest}")"
  touch "${dest}"

  python3 - "$src" "$dest" "$start" "$end" <<'PYAPPEND'
from pathlib import Path
import sys
src_path = Path(sys.argv[1])
dest_path = Path(sys.argv[2])
start = sys.argv[3]
end = sys.argv[4]
block = f"\n{start}\n" + src_path.read_text(encoding="utf-8") + f"\n{end}\n"
text = dest_path.read_text(encoding="utf-8") if dest_path.exists() else ""
if start in text and end in text:
    before = text.split(start, 1)[0]
    after = text.split(end, 1)[1]
    text = before.rstrip() + block + after.lstrip()
else:
    text = text.rstrip() + block + "\n"
dest_path.write_text(text, encoding="utf-8")
PYAPPEND
  log "Updated ${dest}"
}

TMP_DIR="$(mktemp -d)"
SCRIPT_DIR="$(detect_script_dir)"
SKILL_MD="${TMP_DIR}/greenfield_ux.md"
CODEX_SKILL_MD="${TMP_DIR}/codex-greenfield-ux.md"
GEMINI_TOML="${TMP_DIR}/greenfield-ux.toml"

require_cmd python3

fetch_file "greenfield_ux.md" "${SKILL_MD}"
fetch_file "skills/greenfield-ux/SKILL.md" "${CODEX_SKILL_MD}"
fetch_file "commands/greenfield-ux.toml" "${GEMINI_TOML}"

rm -f "${HOME}/.claude/commands/${SKILL_NAME}.md"
rm -f "${HOME}/.claude/skills/${SKILL_NAME}.md"
copy_file "${CODEX_SKILL_MD}" "${HOME}/.claude/skills/${SKILL_NAME}/SKILL.md"
copy_file "${SKILL_MD}" "${HOME}/.cursor/commands/${SKILL_NAME}.md"
rm -f "${HOME}/.cursor/rules/${SKILL_NAME}.mdc"
copy_file "${SKILL_MD}" "${HOME}/.config/opencode/commands/${SKILL_NAME}.md"
copy_file "${SKILL_MD}" "${HOME}/.config/amp/commands/${SKILL_NAME}.md"
copy_file "${GEMINI_TOML}" "${HOME}/.gemini/commands/${SKILL_NAME}.toml"
copy_file "${SKILL_MD}" "${HOME}/.gemini/antigravity/global_skills/${SKILL_NAME}/SKILL.md"
copy_file "${CODEX_SKILL_MD}" "${HOME}/.codex/skills/${SKILL_NAME}/SKILL.md"
append_marked_block "${SKILL_MD}" "${HOME}/.codeium/windsurf/memories/global_rules.md"

log "Done."
log "Claude Code: restart, then use /greenfield-ux."
log "Codex: restart, then invoke with \$greenfield-ux or ask to use greenfield-ux."
