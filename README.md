# Greenfield UX

Greenfield UX is an AI coding skill for building and reviewing modern product interfaces.

It installs your UX checklist into common coding-agent skill locations so users can ask their agent to apply Greenfield UX while generating, refactoring, or reviewing UI.

## What is included

- `greenfield_ux.md`: the main skill file
- `skills/greenfield-ux/SKILL.md`: generic skill format
- `commands/greenfield-ux.md`: slash-command friendly markdown
- `commands/greenfield-ux.toml`: Gemini CLI command format
- `install.sh`: optional custom installer for slash-command files
- `uninstall.sh`: cleanup script

## Install

```bash
npx -y skills add https://github.com/size12font/greenfield-ux --skill greenfield-ux -g -a '*' -y --copy
```

This uses the standard `skills` installer. It reads `skills/greenfield-ux/SKILL.md` from this repo and installs it globally for supported agents.

## Optional slash-command installer

Use this only if you also want this repo's custom command files copied into tools that support slash commands.

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

## What gets installed with `npx skills add`

The standard installer copies `SKILL.md` into supported agent skill directories, including Codex, Claude Code, Antigravity, Windsurf, and the shared `~/.agents/skills/greenfield-ux/SKILL.md` folder.

## Extra files from `install.sh`

| Tool | Install location |
|---|---|
| Codex | `~/.codex/skills/greenfield-ux/SKILL.md`, `~/.codex/commands/greenfield-ux.md`, and `~/.codex/prompts/greenfield-ux.md` |
| Antigravity | `~/.gemini/antigravity/global_skills/greenfield-ux/SKILL.md` |
| Claude Code | `~/.claude/commands/greenfield-ux.md` and `~/.claude/skills/greenfield-ux/SKILL.md` |
| Cursor | `~/.cursor/commands/greenfield-ux.md` and `~/.cursor/rules/greenfield-ux.mdc` |
| OpenCode | `~/.config/opencode/commands/greenfield-ux.md` |
| Amp | `~/.config/amp/commands/greenfield-ux.md` |
| Gemini CLI | `~/.gemini/commands/greenfield-ux.toml` |
| Windsurf | appends a marked block to `~/.codeium/windsurf/memories/global_rules.md` |
| Generic agent skill folder | `~/.agents/skills/greenfield-ux/SKILL.md` |

## Usage

Ask your coding agent:

```text
Use Greenfield UX to review this UI and return concrete changes.
```

Codex:

```text
$greenfield-ux Review this settings page and improve the interaction design.
```

Claude Code and agents with slash-command support:

```text
/greenfield-ux Review this settings page and improve the interaction design.
```

## Uninstall

```bash
npx -y skills remove greenfield-ux -g -a '*' -y
```

If you used `install.sh`, run:

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
