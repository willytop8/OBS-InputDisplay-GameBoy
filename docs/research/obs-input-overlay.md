# Ecosystem Research — OBS Input Overlay Plugin

**Date:** 2026-07-11
**Versions checked:** Input Overlay v5.x (latest release Apr 2025), OBS Studio 31.x

## Plugin Overview

- **Repository:** univrsal/input-overlay (4.1k stars, GPL-2.0)
- **Platforms:** Windows (64-bit), Linux (64-bit). **No macOS support.**
- **Last release:** Apr 6, 2025 (v5.0.5+)
- **Installation:** Installer (Windows) or manual .so/.dll placement

## Integration Modes

### Mode 1: Native OBS Source
- User creates "Input Overlay" source
- Provides: texture PNG (atlas) + JSON config (layout)
- Plugin's C++ code composites texture elements based on input state
- Static element types: texture, keyboard key, mouse button, gamepad button, analog stick, trigger, d-pad

### Mode 2: WebSocket Server
- Enabled via Tools → Input Overlay Settings in OBS
- Default: `ws://localhost:16899` (configurable port + bind address)
- Broadcasts JSON messages to all connected clients
- Messages include keyboard state, gamepad state, mouse events
- Plugin provides an `example.html` for reference rendering
- Community browser-source renderer: tc-imba/input-overlay-browser-source (GPL-2.0)

## Preset Format

- `.json` config file + `.png` texture atlas
- Config defines elements with type, position, size, and input mapping
- Config creation tool: https://univrsal.github.io/input-overlay/cct/
- Community preset packs distributed as zip archives

## Key Limitations

- **No macOS:** Plugin is Windows/Linux only
- **No CSS transitions in native mode:** Only static image swaps
- **WebSocket is unencrypted:** Plugin warns "for trusted local network only"
- **Keycode scheme is uiohook-based:** Uses a fork of libuiohook (TolikPylypchuk fork)
- **Gamepad support:** XInput + DirectInput via SDL2

## Competing/Related Tools

| Tool | What it does | Different from GB Input Display? |
|---|---|---|
| Input Overlay built-in presets | WASD, mouse, gamepad overlays | Generic — not Game Boy specific |
| tc-imba/input-overlay-browser-source | Canvas renderer for Input Overlay presets | Generic keyboard/mouse, no Game Boy semantics |
| NohBoard | Standalone keyboard overlay | Keyboard only, no gamepad |
| Gamepad Viewer | Browser-based gamepad viewer | Gamepad only, no keyboard |

## Recommendation for Phase A

Use **WebSocket + Browser Source** integration:
1. User installs Input Overlay plugin
2. Enables WebSocket server (one checkbox in Tools menu)
3. Adds OBS Browser Source pointing at our `index.html`
4. Our renderer connects to `ws://localhost:16899`

This gives full CSS/JS freedom for animations, responsive layouts, and theming.

**Tested plugin versions (to pin):** Input Overlay v5.0.5
**Tested OBS versions:** OBS Studio 31.x (Windows)
