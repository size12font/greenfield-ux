# Greenfield UX

Greenfield UX is an AI coding skill for building and reviewing modern product interfaces.

It installs your UX checklist into common coding-agent locations so users can ask their agent to apply Greenfield UX while generating, refactoring, or reviewing UI.

## What is included

- `greenfield_ux.md`: the main skill file
- `skills/greenfield-ux/SKILL.md`: generic skill format
- `commands/greenfield-ux.md`: slash-command friendly markdown
- `commands/greenfield-ux.toml`: Gemini CLI command format
- `install.sh`: installer
- `uninstall.sh`: cleanup script

## Install from GitHub

```bash
curl -fsSL https://raw.githubusercontent.com/size12font/greenfield-ux/main/install.sh | bash
```

## Install locally

```bash
git clone https://github.com/size12font/greenfield-ux.git
cd greenfield-ux
chmod +x install.sh uninstall.sh
./install.sh
```

## What gets installed

| Tool | Install location |
|---|---|
| Claude Code | `~/.claude/commands/greenfield-ux.md` |
| Cursor | `~/.cursor/commands/greenfield-ux.md` and `~/.cursor/rules/greenfield-ux.mdc` |
| OpenCode | `~/.config/opencode/commands/greenfield-ux.md` |
| Amp | `~/.config/amp/commands/greenfield-ux.md` |
| Gemini CLI | `~/.gemini/commands/greenfield-ux.toml` |
| Antigravity | `~/.gemini/antigravity/global_skills/greenfield-ux/SKILL.md` |
| Windsurf | appends a marked block to `~/.codeium/windsurf/memories/global_rules.md` |
| Generic Codex-style folder | `~/.codex/skills/greenfield-ux/SKILL.md` |

## Usage

Ask your coding agent:

```text
Use Greenfield UX to review this UI and return concrete changes.
```

Or, where slash commands are supported:

```text
/greenfield-ux Review this settings page and improve the interaction design.
```

In Codex, restart the app after installing so new skills are indexed, then ask:

```text
Use greenfield-ux to review this settings page and improve the interaction design.
```

## Uninstall

```bash
./uninstall.sh
```

## Recommended GitHub repo setup

```bash
git init
git add .
git commit -m "Initial Greenfield UX skill"
gh repo create greenfield-ux --public --source=. --remote=origin --push
```

## License

MIT
