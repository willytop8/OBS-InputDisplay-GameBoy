# ADR 0001: Phase A Integration Route — WebSocket + Browser Source

**Date:** 2026-07-11
**Status:** Accepted

## Context

The GB Input Display project needs to render Game Boy button inputs in OBS. The handoff calls for rich visual feedback:
- 40-70ms depression transitions
- 80-140ms release transitions
- Small highlight shifts and 1-2px apparent depth changes
- CSS-based theming
- Multiple responsive layouts (horizontal, compact, vertical, minimal)

The Input Overlay plugin (univrsal/input-overlay, v5.x, 4.1k stars) offers two integration modes:

1. **Native preset mode:** OBS source type that composites a PNG texture atlas using a JSON layout config. Rendering is done inside the plugin's C++ code with static image swaps.

2. **WebSocket + Browser Source mode:** Plugin runs a WebSocket server on `ws://localhost:16899` broadcasting input state as JSON. A Browser Source loads an HTML/JS page that connects to this WebSocket and renders freely with HTML/CSS/JS.

## Options

### Option A: Native Preset (Texture + JSON)

- Distribute a `.png` texture atlas + `.json` config file
- User creates Input Overlay source, points at both files
- Plugin renders using its built-in C++ element system

**Verdict: Rejected.** Cannot support CSS transitions, responsive layouts, dark/light themes, or the animation requirements in the spec. Would require users to use the io-cct config tool for any customization. Limited to plugin's element types (keyboard key, mouse button, gamepad button, analog stick, trigger, d-pad) — no Game Boy-specific button semantics.

### Option B: WebSocket + Browser Source (Selected)

- Distribute an HTML/CSS/JS browser-source renderer
- User: (1) enables WebSocket in Input Overlay settings, (2) adds Browser Source pointing at our `index.html`
- Our renderer connects to `ws://localhost:16899`, receives input state, renders with full CSS/JS

**Verdict: Selected.** This is the only path that supports:
- Rich CSS transitions for button press/release
- Multiple responsive layouts via CSS media queries / viewBox
- Data-driven theming (swap SVG assets per theme)
- Game Boy-specific action normalization (map raw keycodes → Game Boy actions)
- Smooth animations, depth effects, highlight shifts

The additional setup step ("enable WebSocket in Input Overlay settings") is an acceptable cost. The spec calls for "install-to-visible-inputs in under five minutes" — we can achieve this with clear instructions and a helper page.

### Option C: Standalone Local Helper (Phase B, deferred)

- Build our own keyboard/gamepad capture app
- Normalize to Game Boy actions locally
- Broadcast over our own WebSocket
- Browser source connects to our WebSocket

**Verdict: Deferred to Phase B.** Removes dependency on Input Overlay plugin entirely and adds macOS support, but requires significantly more development (global keyboard hooks, gamepad APIs, packaging, signing, security review). The spec explicitly says "Do not begin Phase C before the Phase A preset is tested by real runners" — Phase B similarly should wait until Phase A validates demand.

### Option D: Custom OBS Plugin (Rejected)

- Build a native OBS plugin from scratch
- Capture inputs, normalize, render — all in C/C++

**Verdict: Rejected.** Enormous maintenance burden. Ties us to OBS's C++ plugin API, OS-specific builds, and manual distribution. The spec explicitly excludes this from MVP.

## Decision

**Use the Input Overlay plugin's WebSocket server + a custom OBS Browser Source renderer.**

Architecture:
```
Keyboard/Gamepad → Input Overlay Plugin → WebSocket (ws://localhost:16899) → GB Input Display (HTML/JS) → OBS Browser Source
```

Our renderer will:
1. Connect to `ws://localhost:16899`
2. Parse raw Input Overlay JSON messages (key codes, gamepad button indices)
3. Map to normalized Game Boy actions (up/down/left/right/a/b/start/select/l/r)
4. Render the current theme's SVG layout with CSS transitions
5. Support multiple themes via data-driven SVG assets

## Consequences

**Positive:**
- Full CSS/JS freedom for animations, layouts, and theming
- Zero native compilation needed — just HTML/CSS/JS/SVG
- Leverages well-maintained, popular plugin (4.1k stars)
- Users already familiar with Input Overlay (speedrun community standard)
- Keyboard and gamepad work identically (plugin handles both)

**Negative:**
- Requires Input Overlay plugin (Windows/Linux only, no macOS in Phase A)
- Users must enable WebSocket server (one extra settings toggle)
- WebSocket is unencrypted — spec already specifies localhost binding
- Cannot detect when no inputs are active (plugin only sends events on state change)
- Dependency on plugin's keycode scheme (must translate to Game Boy actions)

**Risks:**
- Input Overlay WebSocket protocol could change in future versions
- Plugin only supports Windows/Linux (macOS users blocked until Phase B)

**Mitigations:**
- Pin tested Input Overlay versions
- Abstract WebSocket client behind adapter interface for future protocol changes
- Document macOS limitation clearly; Phase B resolves it

## Revisit Trigger

Revisit if:
- Input Overlay plugin is abandoned or breaks on a new OBS version
- A macOS-compatible input capture emerges that could accelerate Phase B
- Community feedback shows WebSocket setup is a significant adoption barrier
