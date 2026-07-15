# GB Input Display

The open-source Game Boy input display for OBS — built for the speedrunning community.

**One HTML file. One plugin. Five-minute setup.**

![Preview](docs/preview.png)

## What It Does

Shows your live Game Boy button inputs (D-pad, A/B, Start/Select) as an overlay in OBS. Works with keyboard, gamepad, or both simultaneously. Looks like premium hardware, not a debug tool.

## Features

- **Four themes** — DMG (original gray), GBC (Atomic Purple), Player Silver, Minimal (buttons only)
- **Instant feedback** — CSS transitions, 50ms press / 120ms release, 1.5px depth
- **Keyboard + gamepad** — both first-class, both simultaneously
- **Transparent background** — drop it anywhere in your OBS layout
- **Themeable** — all colors in CSS custom properties, swap via `?theme=` URL param
- **No account, no cloud, no internet** — everything runs locally
- **Open source** — MIT license for renderer code, original SVG assets free to use

## Quick Start

1. [Install Input Overlay plugin](https://github.com/univrsal/input-overlay/releases)
2. Enable WebSocket server (Tools → Input Overlay Settings → check "Enable WebSocket")
3. Add Browser Source in OBS, point at `apps/overlay-renderer/index.html`
4. Press Arrow keys + Z/X — buttons light up

**Full guide:** [docs/installation.md](docs/installation.md)

## Supported Platforms

| Platform | Input Overlay Plugin | GB Input Display |
|---|---|---|
| Windows 10/11 | ✅ | ✅ |
| Linux (X11) | ✅ | ✅ |
| Linux (Wayland) | ⚠️ Partial | ⚠️ Partial |
| macOS | ❌ | ❌ (Phase B planned) |

## Default Mapping

| Key | Action |
|---|---|
| Arrow Up / W | Up |
| Arrow Down / S | Down |
| Arrow Left / A | Left |
| Arrow Right / D | Right |
| Z | B |
| X | A |
| Enter | Start |
| Right Shift | Select |

## Project Structure

```
apps/overlay-renderer/   # Browser-source HTML renderer
presets/player-silver/   # Default theme (SVG + CSS)
docs/                    # Installation, architecture, research
```

## Roadmap

- **v1.0** — DMG + GBC + Player Silver + Minimal themes, all 8 buttons, keyboard + gamepad, setup guide
- **v1.1** — Compact layouts, GBA theme, Pocket variant
- **v1.2** — Press animations polish, optional sounds, hover effects
- **v1.3** — Theme creation guide, community template, theme sharing
- **v1.4** — Auto-layouts, compact mode, NES/SNES expansions

## Credits

- OBS Input Overlay plugin by [univrsal](https://github.com/univrsal/input-overlay) (GPL-2.0)
- GB Input Display renderer and original artwork by [Will Ricchiuti](https://github.com/willytop8)

## License

Renderer code: MIT  
Original SVG artwork: CC-BY 4.0  
This project is not affiliated with or endorsed by Nintendo. Game Boy is a trademark of Nintendo Co., Ltd.
