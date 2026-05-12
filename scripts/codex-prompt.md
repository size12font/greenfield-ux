# Codex prompt

Use this prompt in Codex after uploading or cloning this repo.

```text
You are working in the greenfield-ux repo.

Goal: prepare this as a public GitHub repo for an installable AI coding skill.

Tasks:
1. Review install.sh and uninstall.sh for shell safety and portability.
2. Confirm GitHub URLs use `size12font`, with `GREENFIELD_UX_RAW_BASE` available for forks.
3. Make sure README.md uses `npx skills add` as the primary install command.
4. Keep install.sh working as the optional slash-command installer.
5. Run shellcheck if available.
6. Create a clean initial commit.
7. Push to GitHub.

Do not change the meaning of greenfield_ux.md unless I explicitly ask.
```
