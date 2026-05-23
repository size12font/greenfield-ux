# Greenfield UX

Greenfield UX is an AI coding skill for building and reviewing modern product interfaces.

Use this skill when creating, refactoring, or reviewing UI, especially SaaS dashboards, admin tools, tables, settings, forms, onboarding, mobile flows, and AI-powered product workflows.

## Operating mode

When applying this skill:

1. Prioritize workflow quality over decoration.
2. Implement interactions, not only static screens.
3. Check accessibility, keyboard behavior, mobile behavior, empty states, loading states, errors, and deep links.
4. Preserve user intent through redirects, authentication, refreshes, and cross-device handoffs.
5. When reviewing code, return concrete fixes and acceptance criteria.
6. When generating code, build the UX rules directly into the implementation.

## Source rules

Required product behaviors

1. Lists with item actions need multi-select. If a list item can be edited, deleted, archived, moved, exported, or otherwise acted on, support multi-select and bulk actions for that action set.
2. Long lists need standard range selection. Support Shift-select for ranges, Cmd/Ctrl-select for non-contiguous selection, and tap+drag selection on touch devices where bulk work is expected.
3. Every list needs filtering and sorting. Provide useful filters and sort controls for all lists. For tables, every column header shows a sort arrow and has a clear ascending, descending, and unsorted state.
4. Settings spanning more than two screens need contextual search. Search should understand intent and nearby concepts, not only exact keyword matches. Results should deep-link directly to the matching setting.
5. Form errors move the user to the problem. On submit, scroll to the first invalid field or error summary, focus it safely, and keep the error message next to the field.
6. Auth never loses intent. If a user starts an action and must log in, return them to the exact same action screen after login with the relevant context preserved.
7. Deep links must preserve the exact experience across web and mobile. Tabs, filters, pagination, selected items, expanded panels, drafts, and action screens must round-trip across app links, universal links, mobile browsers, desktop browsers, and in-app browsers including Facebook's browser.

Interactions

1. [**Keyboard works everywhere.**](https://vercel.com/design/guidelines#keyboard-works-everywhere) All flows are keyboard-operable & follow the [WAI-ARIA Authoring Patterns](https://www.w3.org/WAI/ARIA/apg/patterns/).
2. [**Mobile input size.**](https://vercel.com/design/guidelines#mobile-input-size) `<input>` font size is ≥ 16px on mobile to prevent iOS Safari auto-zoom/pan on focus. Or set
3.  [**Don’t block paste.**](https://vercel.com/design/guidelines#dont-block-paste) Never disable paste in `<input>` or `<textarea>`.
4. Don’t block paste. Never disable paste in <input> or <textarea>.
5. Loading buttons. Show a loading indicator & keep the original label.
6. Minimum loading-state duration. If you show a spinner/skeleton, add a short show-delay (~150–300 ms) & a minimum visible time (~300–500 ms) to avoid flicker on fast responses. The <Suspense> component in React does this automatically.
7. URL as state. Persist state in the URL so share, refresh, Back/Forward navigation work e.g., nuqs.
8. Confirm destructive actions. Require confirmation or provide Undo with a safe window.
9. If there’s a CTA which is the key action step, make sure that’s above the fold for mobile and desktop.
10. Overscroll behavior. Set overscroll-behavior: contain intentionally e.g., in modals/drawers.
11. Deep-link everything. Filters, tabs, pagination, expanded panels, anytime useState is used.
12. No dead zones. If part of a control looks interactive, it should be interactive. Don’t leave users guessing where to interact.
13. Links are links. Use <a> or <Link> for navigation so standard browser behaviors work (Cmd/Ctrl+Click, middle-click, right-click to open in a new tab). Never substitute with <button> or <div> for navigational links.
14. Locale-aware keyboard shortcuts. Internationalize keyboard shortcuts for non-QWERTY layouts. Show platform-specific symbols.
15. Compositor-friendly. Prioritize GPU-accelerated properties (transform, opacity) & avoid properties that trigger reflows/repaints (width, height, top, left).
16. Easing fits the subject. Choose easing based on what changes (size, distance, trigger)
- [**Optical alignment.**](https://vercel.com/design/guidelines#optical-alignment) [Adjust ±1px](https://x.com/JohnPhamous/status/1760444698857230360) when perception beats geometry.
- [**Deliberate alignment.**](https://vercel.com/design/guidelines#deliberate-alignment) Every element aligns with something intentionally whether to a grid, baseline, edge, or optical center. No accidental positioning.
- [**Balance contrast in lockups.**](https://vercel.com/design/guidelines#balance-contrast-in-lockups) When text & icons sit side by side, adjust weight, size, spacing, or color so they don’t clash. For example, a thin-stroke icon may need a bolder stroke next to medium-weight text.
- [**Responsive coverage.**](https://vercel.com/design/guidelines#responsive-coverage) Verify on mobile, laptop, & ultra-wide. For ultra-wide, zoom out to 50% to simulate.
- [**Respect safe areas.**](https://vercel.com/design/guidelines#respect-safe-areas) Account for notches & insets with [safe-area variables](https://developer.mozilla.org/en-US/docs/Web/CSS/env).
- [**No excessive scrollbars.**](https://vercel.com/design/guidelines#no-excessive-scrollbars) Only render useful scrollbars; fix overflow issues to prevent unwanted scrollbars. On macOS set ["Show scroll bars" to "Always"](https://support.apple.com/guide/mac-help/change-appearance-settings-mchlp1225/mac#:~:text=or%20status%20bars.-,Show%20scroll%20bars,-Scroll%20bars%20appear) to test what Windows users would see.
- [**Let the browser size things.**](https://vercel.com/design/guidelines#let-the-browser-size-things) Prefer flex/grid/intrinsic layout over measuring in JS. Avoid layout thrash by letting CSS handle flow, wrapping, & alignment.

## [**Content**](https://vercel.com/design/guidelines#content)

- [**Inline help first.**](https://vercel.com/design/guidelines#inline-help-first) Prefer inline explanations; use tooltips as a last resort.
- [**Stable skeletons.**](https://vercel.com/design/guidelines#stable-skeletons) Skeletons mirror final content exactly to avoid layout shift.
- [**Accurate page titles.**](https://vercel.com/design/guidelines#accurate-page-titles) `<title>` reflects the current context.
- [**No dead ends.**](https://vercel.com/design/guidelines#no-dead-ends) Every screen offers a next step or recovery path.
- [**All states designed.**](https://vercel.com/design/guidelines#all-states-designed) Empty, sparse, dense, & error states.
- [**Typographic quotes.**](https://vercel.com/design/guidelines#typographic-quotes) Prefer curly quotes (“ ”) over straight quotes (" ").
- [**Avoid widows/orphans.**](https://vercel.com/design/guidelines#avoid-widowsorphans) Tidy rag & line breaks.
- [**Tabular numbers for comparisons.**](https://vercel.com/design/guidelines#tabular-numbers-for-comparisons) Use `font-variant-numeric: tabular-nums` or a monospace like [Geist Mono](https://vercel.com/font).
- [**Redundant status cues.**](https://vercel.com/design/guidelines#redundant-status-cues) Don’t rely on color alone; include text labels.
- [**Icons have labels.**](https://vercel.com/design/guidelines#icons-have-labels) Convey the same meaning with text for non-sighted users.
- [**Don’t ship the schema.**](https://vercel.com/design/guidelines#dont-ship-the-schema) Visual layouts may omit visible labels, but accessible names/labels still exist for assistive tech.
- [**Use the ellipsis character.**](https://vercel.com/design/guidelines#use-the-ellipsis-character) `…` over three periods `...`.
- [**Anchored headings.**](https://vercel.com/design/guidelines#anchored-headings) Set `scroll-margin-top` for headers when linking to sections.
- [**Resilient to user-generated content.**](https://vercel.com/design/guidelines#resilient-to-user-generated-content) Layouts handle short, average, & very long content.
- [**Locale-aware formats.**](https://vercel.com/design/guidelines#locale-aware-formats) Format dates, times, numbers, delimiters, & currencies for the user’s locale.
- [**Prefer language settings over location.**](https://vercel.com/design/guidelines#prefer-language-settings-over-location) Detect language via `Accept-Language` header & `navigator.languages`. Never rely on IP/GPS for language.
- [**Shield verbatim content from translation.**](https://vercel.com/design/guidelines#shield-verbatim-content-from-translation) Wrap brand names, product names, code tokens, & technical identifiers with `translate="no"` so browser auto-translate leaves them intact.
- [**Accessible content.**](https://vercel.com/design/guidelines#accessible-content) Set accurate names (`aria-label`), hide decoration (`aria-hidden`) & verify in the [accessibility tree](https://developer.chrome.com/blog/full-accessibility-tree).
- [**Icon-only buttons are named.**](https://vercel.com/design/guidelines#icon-only-buttons-are-named) Provide a descriptive `aria-label`.
- [**Semantics before ARIA.**](https://vercel.com/design/guidelines#semantics-before-aria) Prefer native elements (`button`, `a`, `label`, `table`), before `aria-*`.
- [**Headings & skip link.**](https://vercel.com/design/guidelines#headings-skip-link) Hierarchical `<h1–h6>` & a “Skip to content” link.
- [**Brand resources from the logo.**](https://vercel.com/design/guidelines#brand-resources-from-the-logo) [Right-click the nav logo](https://x.com/JohnPhamous/status/1636427186566762496) to surface brand assets for quick access.

## [**Forms**](https://vercel.com/design/guidelines#forms)

- [**Enter submits.**](https://vercel.com/design/guidelines#enter-submits) When a text input is focused, Enter submits if it's the only control. If there are many controls, apply to the last control.
- [**Textarea behavior.**](https://vercel.com/design/guidelines#textarea-behavior) In `<textarea>`, ⌘/⌃+Enter submits; Enter inserts a new line.
- [**Labels everywhere.**](https://vercel.com/design/guidelines#labels-everywhere) Every control has a `<label>` or is associated with a label for assistive tech.
- [**Label activation.**](https://vercel.com/design/guidelines#label-activation) Clicking a `<label>` focuses the associated control.
- [**Submission rule.**](https://vercel.com/design/guidelines#submission-rule) Keep submit enabled until submission starts; then disable during the in-flight request, show a spinner, & include an idempotency key.
- [**Don’t block typing.**](https://vercel.com/design/guidelines#dont-block-typing) Even if a field only accepts numbers, allow any input & show validation feedback. Blocking keystrokes entirely is confusing because the user gets no explanation.
- [**Don’t pre-disable submit.**](https://vercel.com/design/guidelines#dont-pre-disable-submit) Allow submitting incomplete forms to surface validation feedback.
- [**No dead zones on controls.**](https://vercel.com/design/guidelines#no-dead-zones-on-controls) Checkboxes & radios avoid dead zones; the label & control share a single generous hit target.
- [**Error placement.**](https://vercel.com/design/guidelines#error-placement) Show errors next to their fields; on submit, focus the first error.
- [**Autocomplete & names.**](https://vercel.com/design/guidelines#autocomplete-names) Set `autocomplete` & meaningful `name` values to enable autofill.
- [**Spellcheck selectively.**](https://vercel.com/design/guidelines#spellcheck-selectively) Disable for emails, codes, usernames, etc.
- [**Correct types & input modes.**](https://vercel.com/design/guidelines#correct-types-input-modes) Use the right `type` & `inputmode` for better keyboards & validation.
- [**Placeholders signal emptiness.**](https://vercel.com/design/guidelines#placeholders-signal-emptiness) End with an ellipsis.
- [**Placeholder value.**](https://vercel.com/design/guidelines#placeholder-value) Set placeholder to an example value or pattern e.g., `+1 (123) 456-7890` & `sk-012345679…`
- [**Unsaved changes.**](https://vercel.com/design/guidelines#unsaved-changes) Warn before navigation when data could be lost.
- [**Password managers & 2FA.**](https://vercel.com/design/guidelines#password-managers-2fa) Ensure compatibility & allow pasting one-time codes.
- [**Don’t trigger password managers for non-auth fields.**](https://vercel.com/design/guidelines#dont-trigger-password-managers-for-non-auth-fields) For inputs like “Search” avoid reserved names (e.g., password), use `autocomplete="off"` or a specific token like `autocomplete="one-time-code"` for OTP fields.
- [**Text replacements & expansions.**](https://vercel.com/design/guidelines#text-replacements-expansions) Some input methods add trailing whitespace. The input should trim the value to avoid showing a confusing error message.
- [**Windows `<select>` background.**](https://vercel.com/design/guidelines#windows-select-background) Explicitly set `background-color` & `color` on native `<select>` to avoid dark-mode contrast bugs on Windows.

## [**Performance**](https://vercel.com/design/guidelines#performance)

- [**Device/browser matrix.**](https://vercel.com/design/guidelines#devicebrowser-matrix) Test iOS Low Power Mode & macOS Safari.
- [**Measure reliably.**](https://vercel.com/design/guidelines#measure-reliably) Disable extensions that add overhead or change runtime behavior.
- [**Track re-renders.**](https://vercel.com/design/guidelines#track-re-renders) Minimize & make re-renders fast. Use [React DevTools](https://react.dev/learn/react-developer-tools) or [React Scan](https://react-scan.com/).
- [**Throttle when profiling.**](https://vercel.com/design/guidelines#throttle-when-profiling) Test with CPU & network throttling.
- [**Minimize layout work.**](https://vercel.com/design/guidelines#minimize-layout-work) Batch reads/writes; avoid unnecessary reflows/repaints.
- [**Network latency budgets.**](https://vercel.com/design/guidelines#network-latency-budgets) `POST/PATCH/DELETE` complete in <500ms.
- [**Keystroke cost.**](https://vercel.com/design/guidelines#keystroke-cost) Prefer uncontrolled inputs; make controlled loops cheap.
- [**Large lists.**](https://vercel.com/design/guidelines#large-lists) Virtualize large lists e.g., [virtua](https://github.com/inokawa/virtua) or [content-visibility: auto](https://web.dev/articles/content-visibility).
- [**Preload wisely.**](https://vercel.com/design/guidelines#preload-wisely) Preload only above-the-fold images; lazy-load the rest.
- [**No image-caused CLS.**](https://vercel.com/design/guidelines#no-image-caused-cls) Set explicit image dimensions & reserve space.
- [**Preconnect to origins.**](https://vercel.com/design/guidelines#preconnect-to-origins) Use `<link rel="preconnect">` for asset/CDN domains (with crossorigin when needed) to reduce DNS/TLS latency.
- [**Preload fonts.**](https://vercel.com/design/guidelines#preload-fonts) For critical text to avoid flash & layout shift.
- [**Subset fonts.**](https://vercel.com/design/guidelines#subset-fonts) Ship only the code points/scripts you use via unicode-range (limit variable axes to what you need) to shrink size.
- [**Don’t use the main thread for expensive work.**](https://vercel.com/design/guidelines#dont-use-the-main-thread-for-expensive-work) Move especially long tasks to [Web Workers](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API) to avoid blocking interaction with the page.

## [**Design**](https://vercel.com/design/guidelines#design)

- [**Layered shadows.**](https://vercel.com/design/guidelines#layered-shadows) Mimic ambient + direct light with at least two layers.
- [**Crisp borders.**](https://vercel.com/design/guidelines#crisp-borders) Combine borders & shadows; semi-transparent borders improve edge clarity.
- [**Nested radii.**](https://vercel.com/design/guidelines#nested-radii) Child radius ≤ parent radius & concentric so curves align.
- [**Hue consistency.**](https://vercel.com/design/guidelines#hue-consistency) On non-neutral backgrounds, tint borders/shadows/text toward the same hue.
- [**Accessible charts.**](https://vercel.com/design/guidelines#accessible-charts) Use color-blind-friendly palettes.
- [**Minimum contrast.**](https://vercel.com/design/guidelines#minimum-contrast) Prefer [APCA](https://apcacontrast.com/) over [WCAG 2](https://webaim.org/resources/contrastchecker/) for more accurate perceptual contrast.
- [**Interactions increase contrast.**](https://vercel.com/design/guidelines#interactions-increase-contrast) `:hover`, `:active`, `:focus` have more contrast than rest state.
- [**Browser UI matches your background.**](https://vercel.com/design/guidelines#browser-ui-matches-your-background) Set `<meta name="theme-color" content="#000000">` to [align the browser’s theme color with the page background](https://x.com/JohnPhamous/status/1816160187839107342).
- [**Set the appropriate color-scheme.**](https://vercel.com/design/guidelines#set-the-appropriate-color-scheme) Style the `<html>` tag with `color-scheme: dark` in dark themes so that scrollbars and other device UI have proper contrast.
- [**Text anti-aliasing & transforms.**](https://vercel.com/design/guidelines#text-anti-aliasing-transforms) Scaling text can change smoothing. Prefer animating a wrapper instead of the text node. If artifacts persist set `translateZ(0)` or `will-change: transform` to promote to its own layer.
- [**Avoid gradient banding.**](https://vercel.com/design/guidelines#avoid-gradient-banding) Fading content to dark colors using css masks can cause banding. [Background images can be used instead](https://x.com/JohnPhamous/status/1724491202148675590).
