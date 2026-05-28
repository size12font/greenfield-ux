---
name: greenfield-ux
description: "Apply Greenfield UX when creating, refactoring, reviewing, polishing, or hardening frontend product UI. Covers SaaS dashboards, admin tools, tables, settings, forms, onboarding, mobile flows, AI-powered workflows, landing pages, app shells, components, empty states, accessibility, keyboard behavior, mobile behavior, URL state, deep links, errors, performance, responsive behavior, visual hierarchy, typography, color, motion, and reusable design systems. Build real working interfaces with strong workflow quality and distinctive craft. Not for backend-only or non-UI tasks."
version: 1.0.0
argument-hint: "[{{command_hint}}] [target]"
user-invocable: true
metadata:
  short-description: Greenfield UX product UI generation and review skill
license: Apache 2.0. Based on Greenfield UX and Anthropic's frontend-design skill. See NOTICE.md for attribution where applicable.
---

# Greenfield UX

Greenfield UX builds and reviews modern product interfaces. It merges workflow-first product UX checks with high-craft frontend design standards. Priority order: usable flow, complete states, accessibility, mobile behavior, performance, then visual distinctiveness.

Build real working code in the project's stack: HTML/CSS/JS, React, Vue, or whatever the repo already uses. The output should be production-grade, functional, cohesive, and meticulously refined, not a static mock unless explicitly requested.

## Operating Mode

When applying this skill:

1. Prioritize workflow quality over decoration.
2. Implement interactions, not only static screens.
3. Check accessibility, keyboard behavior, mobile behavior, empty states, loading states, errors, performance, and deep links.
4. Preserve user intent through redirects, authentication, refreshes, Back/Forward navigation, and cross-device handoffs.
5. When reviewing code, return concrete fixes and acceptance criteria.
6. When generating code, build these UX rules directly into the implementation.

## Setup

Before design work or file edits:

1. Confirm design context.
2. Identify register: brand or product.
3. Load relevant project or command references when available.
4. If reviewing, inspect actual code paths and runtime behavior when feasible.

Skipping context creates generic output.

### Context

At minimum, know:

- Target audience: who uses this and in what context.
- Use cases: what job they are trying to get done.
- Brand personality and tone: how the interface should feel.

Prefer project-local context:

- `PRODUCT.md`: users, brand, tone, anti-references, strategic principles.
- `DESIGN.md`: colors, typography, elevation, components.
- `.impeccable.md`: legacy design context, if present.
- `AGENTS.md`: repo instructions and design constraints.

If a loader script exists, use it:

```bash
node {{scripts_path}}/load-context.mjs
```

Consume full output. Do not pipe through `head`, `tail`, `grep`, or `jq`.

If no useful context exists, run or perform `teach`: scan code and docs, ask only what cannot be inferred, then write design context before major UI work.

### Register

Every task is one of:

- **Brand**: marketing, landing, campaign, content, portfolio. Design is the product.
- **Product**: app UI, admin, dashboard, tool, forms, settings, onboarding. Design serves the workflow.

Choose by explicit task cue, surface in focus, then project context. Product register defaults to dense, ergonomic, state-complete UI. Brand register allows stronger visual identity and composition.

## Design Direction

Commit to a clear point of view before implementation:

- Purpose: what problem this interface solves.
- Audience: who uses it, where, when, and on what device.
- Workflow: the path from intent to completed outcome.
- Tone: concrete aesthetic lane, not "modern" or "clean."
- Constraints: framework, performance, accessibility, content, device contexts.
- Differentiation: what someone will remember.

Bold maximalism and refined minimalism can both work. Intention matters more than intensity.

Match implementation complexity to the vision. Maximalist interfaces may need layered effects, custom animation, and richer interaction code. Minimal or refined interfaces need restraint, precision, typography, spacing, and careful states.

## Workflow Rules

### Navigation And State

- Persist meaningful UI state in the URL: filters, search, tabs, pagination, sort, expanded panels, selected items, wizard steps.
- Deep-link everything a user may share, refresh, or return to.
- Preserve intent across auth redirects and permission gates.
- If an action requires login, return the user to that same action screen after authentication, with their intent preserved.
- Deep-link the exact experience from web to mobile. Test this across browsers, including in-app browsers such as Facebook, Instagram, and Gmail.
- Use links for navigation: `<a>` or framework `Link`. Do not use buttons or divs for navigational links.
- Back and Forward must behave predictably.
- Page titles must reflect current context.
- Set anchored headings with `scroll-margin-top`.
- Confirm destructive actions or provide Undo with a safe window.

### Lists, Tables, And Settings

- If a list allows edit or delete on individual items, it should support multi-select and bulk actions.
- Long lists should support Shift-select, Cmd/Ctrl-select, and tap-drag selection where the platform allows it.
- Every list needs filters and sorting.
- Every sortable table column needs a visible sort affordance, such as a sort arrow, with current sort direction exposed accessibly.
- If settings span more than two screens, add search. Search by context and user intent, not only exact keyword matches.

### Core Interactions

- Keyboard works everywhere. Follow WAI-ARIA Authoring Practices when custom widgets are necessary.
- Prefer semantic HTML before ARIA.
- No dead zones: if part of a control looks interactive, it must be interactive.
- Labels activate their controls.
- Icon-only buttons need accessible names.
- Focus states, hover states, active states, loading states, disabled states, and error states must be designed.
- Interaction states should increase contrast, not reduce it.
- Locale-aware keyboard shortcuts: account for non-QWERTY layouts and platform-specific symbols.
- Overscroll behavior should be intentional, especially in modals and drawers.

### Forms

- Mobile inputs must be at least 16px to avoid iOS focus zoom.
- Never disable paste in inputs or textareas.
- Let Enter submit when a single text input is focused. In textareas, Cmd/Ctrl+Enter submits while Enter inserts a new line.
- Keep submit enabled until submission starts. On submit, disable during the in-flight request, keep the original label visible, show progress, and use idempotency when needed.
- Do not pre-disable submit for incomplete forms. Let submission reveal validation.
- Do not block typing for numeric or constrained inputs. Accept input, then validate with useful feedback.
- Errors appear near fields. On submit, focus first error.
- On submit errors, scroll the user to the first error before focusing it.
- Use correct `type`, `inputmode`, `autocomplete`, and meaningful `name`.
- Avoid reserved names that trigger password managers on non-auth fields.
- Support password managers and 2FA paste.
- Trim text replacement artifacts where useful.
- Explicitly style native select background and color for dark-mode compatibility.
- Warn before navigation when unsaved changes could be lost.

### Loading, Empty, And Error States

- Loading buttons show progress and keep original label.
- Avoid flicker: delay spinner/skeleton display roughly 150 to 300ms, then keep visible roughly 300 to 500ms once shown.
- Skeletons mirror final layout to avoid layout shift.
- Empty states teach the interface and offer a next step.
- Sparse, dense, empty, loading, error, permission-denied, and offline states should be designed.
- No dead ends: every screen offers recovery or a next step.
- Use redundant status cues. Do not rely on color alone.

### Mobile And Responsive

- Critical CTA appears above the fold on mobile and desktop when it drives the main next step.
- Adapt the interface for context, not just size.
- Do not hide critical functionality on mobile.
- Respect safe areas with `env(safe-area-inset-*)`.
- Test mobile, laptop, and ultra-wide. For ultra-wide, zoom out to 50 percent to simulate.
- Avoid unwanted scrollbars. Fix overflow.
- Let the browser size things with flex, grid, intrinsic layout, wrapping, and alignment before using JS measurements.
- Use stable dimensions and responsive constraints for boards, grids, toolbars, icon buttons, counters, and tiles.
- Text must fit inside parents across mobile and desktop.

## Visual Design Rules

### Theme

Dark vs light is never a default. Choose from the physical scene: who uses this, where, under what ambient light, in what mood, on what device.

"Observability dashboard" does not decide theme. "SRE glancing at incident severity on a 27-inch monitor at 2am in a dim room" does.

### Color

- Use OKLCH and modern CSS color functions where possible.
- Use CSS variables or the project's token system for reusable color decisions.
- Reduce chroma as lightness approaches 0 or 100.
- Never use pure `#000` or `#fff`; tint neutrals toward the brand hue.
- Do not use gray text on colored backgrounds. Use a shade of the background color.
- Use color-blind-friendly palettes for charts.
- Prefer APCA for perceptual contrast when available.
- Set `color-scheme` on `html` for dark themes.
- Set browser `theme-color` to match the page background.
- Avoid reflex palettes: cyan on dark, purple-to-blue gradients, neon on dark, finance navy/gold, healthcare white/teal.

Choose a color strategy:

- **Restrained**: tinted neutrals plus one accent under 10 percent.
- **Committed**: one saturated color carries 30 to 60 percent of the surface.
- **Full palette**: 3 to 4 named roles used deliberately.
- **Drenched**: surface is the color.

### Typography

Before naming a font:

1. Write 3 concrete brand words. Avoid "modern" and "elegant."
2. List the fonts you would normally reach for.
3. Reject reflex defaults:

```text
Fraunces
Newsreader
Lora
Crimson
Crimson Pro
Crimson Text
Playfair Display
Cormorant
Cormorant Garamond
Syne
IBM Plex Mono
IBM Plex Sans
IBM Plex Serif
Space Mono
Space Grotesk
Inter
DM Sans
DM Serif Display
DM Serif Text
Outfit
Plus Jakarta Sans
Instrument Sans
Instrument Serif
Roboto
Arial
Open Sans
system-ui
```

Rules:

- Pair a distinctive display face with a refined body face when brand context allows.
- Use a modular scale. Marketing/content pages may use fluid `clamp()` headings. App UIs and dashboards should use fixed `rem` scales.
- Use fewer sizes with stronger contrast. Aim for at least 1.25 ratio between hierarchy steps.
- Cap body line length at 65 to 75ch.
- Use tabular numbers for comparisons.
- Use typographic quotes in final UI copy when the file already supports Unicode.
- Avoid widows and orphans in prominent text.
- Do not use monospace as lazy shorthand for technical vibes.
- Do not set long body passages in uppercase.

### Layout And Space

- Use a 4pt spacing scale with semantic tokens: 4, 8, 12, 16, 24, 32, 48, 64, 96.
- Use `gap` for sibling spacing.
- Vary spacing for hierarchy and rhythm.
- Use `grid-template-columns: repeat(auto-fit, minmax(280px, 1fr))` for breakpoint-free card-style grids.
- Use container queries for components, viewport queries for page layout.
- Align deliberately to grid, baseline, edge, or optical center.
- Adjust optical alignment by 1px when perception beats geometry.
- Balance contrast in icon/text lockups through stroke, weight, size, spacing, and color.
- Use unexpected composition when it supports the workflow or brand: asymmetry, overlap, diagonal flow, grid-breaking elements, generous negative space, or controlled density.
- Use layered shadows when elevation matters: ambient plus direct light.
- Combine borders and shadows for crisp edges.
- Child radii should be less than or equal to parent radii and visually concentric.
- On non-neutral backgrounds, tint borders, shadows, and text toward the same hue.

### Backgrounds And Atmosphere

- Avoid defaulting to flat solid backgrounds when the surface needs identity or depth.
- Use contextual atmosphere only when it supports the product or brand: subtle texture, noise, geometric pattern, layered transparency, dramatic shadow, decorative border, custom cursor, grain overlay, or gradient mesh.
- Background effects must not reduce readability, contrast, performance, or task focus.
- Decorative layers should be purposeful and hidden from assistive tech.

Do not:

- Wrap everything in cards or containers.
- Nest cards.
- Center everything by default.
- Use identical card grids.
- Let body text exceed roughly 80 characters per line.

### Motion

- Use motion to explain state changes: entrances, exits, feedback, continuity.
- One well-orchestrated page load can beat scattered micro-interactions.
- For HTML/CSS-first work, prefer CSS-only animation when it is enough.
- For React work, use the project's existing motion library when available.
- Staggered reveals with `animation-delay` can create stronger first impression than many unrelated micro-interactions.
- Scroll-triggered and hover interactions should reveal useful affordance or character, not random movement.
- Use exponential easing: ease-out-quart, ease-out-quint, ease-out-expo.
- Animate transform and opacity before layout properties.
- Avoid width, height, top, left, padding, and margin animations.
- For height-like reveals, prefer `grid-template-rows` transitions.
- Animate wrappers instead of text nodes when scaling text to avoid anti-aliasing artifacts.
- No bounce or elastic easing unless the product's physical metaphor demands it.
- Respect reduced motion.

## Content Rules

- Inline help first. Tooltips are a last resort.
- Every word earns its place.
- No headings followed by intros that restate the heading.
- Prefer concrete labels and useful errors.
- Format dates, times, numbers, delimiters, and currency for locale.
- Prefer language settings over location. Use `Accept-Language` and `navigator.languages`; do not infer language from IP/GPS.
- Wrap brand names, product names, code tokens, and technical identifiers with `translate="no"` when browser translation could damage them.
- Hide decorative elements with `aria-hidden`.
- Use headings in order and include a skip link for substantial pages.
- No em dashes. Use commas, colons, semicolons, periods, or parentheses. Also not `--`.

## Performance Rules

- Measure reliably. Disable extensions that alter runtime when profiling.
- Test iOS Low Power Mode and macOS Safari for important UI.
- Minimize re-renders. Use React DevTools, React Scan, or equivalent when relevant.
- Test with CPU and network throttling for performance-sensitive flows.
- Batch reads and writes. Avoid layout thrash.
- POST, PATCH, and DELETE interactions should feel complete within 500ms where product constraints allow.
- Prefer uncontrolled inputs when keystroke cost matters.
- Virtualize large lists with a proven library or `content-visibility: auto`.
- Preload only above-the-fold images. Lazy-load the rest.
- Set explicit image dimensions or aspect ratios to prevent CLS.
- Preconnect to important asset/CDN origins with crossorigin when needed.
- Preload critical fonts and subset fonts where feasible.
- Move expensive work off the main thread.
- Avoid gradient banding; prefer better source images or masks when needed.

## Absolute Bans

Match and refuse. If about to write one, rewrite the element with different structure.

1. **Side-stripe borders**: `border-left` or `border-right` greater than 1px as colored accent on cards, list items, callouts, or alerts.
2. **Gradient text**: `background-clip: text` or `-webkit-background-clip: text` combined with a gradient.
3. **Glassmorphism as default**: blur effects and glass cards used decoratively.
4. **Hero-metric template**: big number, small label, supporting stats, gradient accent.
5. **Identical card grids**: same-size cards with icon, heading, text repeated endlessly.
6. **Decorative sparklines**: charts that look sophisticated but convey nothing.
7. **Generic rounded rectangles with drop shadows**: safe, forgettable, could be any AI output.
8. **Modal as first thought**: exhaust inline, progressive, or page-level alternatives first.

## AI Slop Test

If someone could look at the interface and say "AI made that" without doubt, it failed.

Run category-reflex checks:

- **First-order**: if theme and palette are guessable from category alone, rework the scene and color strategy.
- **Second-order**: if aesthetic family is guessable from category plus anti-reference, rework again.

## Review Output

When reviewing, lead with findings. Each finding needs:

- Severity.
- File or route.
- Problem.
- Concrete fix.
- Acceptance criteria.

Prioritize blockers that affect task completion, accessibility, data loss, mobile usability, navigation, performance, and missing states.

## Generation Checklist

Before considering UI done, verify:

- Main workflow works end to end.
- Keyboard path works.
- Screen reader names exist for controls.
- Mobile input zoom is avoided.
- URL state covers share/refresh/back.
- Exact web-to-mobile deep links work, including common in-app browsers.
- Auth redirects return users to the same intended action.
- Loading, empty, error, disabled, and permission states exist.
- CTA hierarchy is clear and main CTA is visible when needed.
- Form validation is useful and paste-friendly.
- Submit errors scroll and focus the first invalid field.
- Editable/deletable lists have multi-select and bulk actions.
- Long lists support Shift-select, Cmd/Ctrl-select, and tap-drag where appropriate.
- Lists have filters and sort controls.
- Sortable table columns show sort arrows and current direction.
- Settings surfaces over two screens have contextual search.
- Links use link elements.
- Destructive actions have confirmation or undo.
- Layout works on mobile, laptop, and ultra-wide.
- No unwanted scrollbars.
- Text does not overlap or overflow.
- Contrast is acceptable.
- Motion respects reduced motion.
- Performance has no obvious re-render or layout-thrash problem.
- Visual direction is cohesive and memorable, with at least one context-specific design choice.
- Background, texture, or decorative effects support the interface instead of distracting from it.
- Absolute bans are absent.

## Commands

| Command | Category | Description |
|---|---|---|
| `craft [feature]` | Build | Shape, then build a feature end to end |
| `shape [feature]` | Build | Plan UX/UI before writing code |
| `teach` | Build | Set up design context |
| `document` | Build | Generate design docs from existing code |
| `extract [target]` | Build | Pull reusable tokens and components into design system |
| `critique [target]` | Evaluate | UX design review with concrete fixes |
| `audit [target]` | Evaluate | Technical quality checks: a11y, perf, responsive |
| `polish [target]` | Refine | Final quality pass before shipping |
| `bolder [target]` | Refine | Amplify safe or bland designs |
| `quieter [target]` | Refine | Tone down aggressive or overstimulating designs |
| `distill [target]` | Refine | Strip to essence, remove complexity |
| `harden [target]` | Refine | Production-ready errors, i18n, edge cases |
| `onboard [target]` | Refine | First-run flows, empty states, activation |
| `animate [target]` | Enhance | Add purposeful motion |
| `colorize [target]` | Enhance | Add strategic color |
| `typeset [target]` | Enhance | Improve typography |
| `layout [target]` | Enhance | Fix spacing, rhythm, hierarchy |
| `delight [target]` | Enhance | Add personality and memorable touches |
| `overdrive [target]` | Enhance | Push past conventional limits |
| `clarify [target]` | Fix | Improve UX copy, labels, errors |
| `adapt [target]` | Fix | Adapt for devices and screen sizes |
| `optimize [target]` | Fix | Diagnose and fix UI performance |
| `live` | Iterate | Browser-guided visual variant mode |

## Routing

1. **No argument**: render command menu grouped by category, then ask what to do.
2. **First word matches command**: run setup, load any matching command reference if present, then follow command intent.
3. **First word does not match command**: treat as general Greenfield UX invocation. Apply setup, workflow rules, visual laws, and target context.

## Teach Mode

Use `teach` to create missing design context.

1. Explore codebase first:
   - README and docs.
   - Package/config files.
   - Existing components and routes.
   - Brand assets.
   - Design tokens and CSS variables.
   - Existing style guides.
2. Ask only what code cannot answer:
   - Who uses this, in what context?
   - What job are they trying to get done?
   - What should the interface make them feel?
   - Brand personality in 3 concrete words?
   - Reference sites/apps, and what specifically works?
   - Anti-references?
   - Strong aesthetic, theme, or color preferences?
   - Accessibility requirements?
3. Write or update context:

```markdown
## Design Context

### Users
[Who they are, their context, the job to be done]

### Brand Personality
[Voice, tone, 3-word personality, emotional goals]

### Aesthetic Direction
[Visual tone, references, anti-references, theme]

### Design Principles
[3-5 principles that should guide design decisions]
```

Write context to the repo's expected design context file. If no convention exists, use `PRODUCT.md` for audience/strategy and `DESIGN.md` for visual system. Preserve useful legacy `.impeccable.md` content when present.
