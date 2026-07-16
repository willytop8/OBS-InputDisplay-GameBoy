# GB Input Display — Current Status

**Last updated:** 2026-07-16

## Completed

- [x] Repository scaffolded (AGENTS.md, PROJECT.md, STATUS.md, TASKS.md, LICENSE)
- [x] 4 themes: Player Silver (default), DMG, GBC, Minimal
- [x] Browser-source renderer with SVG inline rendering
- [x] Theme switching via `?theme=` URL param with invalid-fallback
- [x] WebSocket client for Input Overlay plugin (exponential backoff, 30-attempt cap)
- [x] Keyboard fallback mode (auto when WebSocket unavailable)
- [x] Gamepad mapping (XInput + analog stick with threshold)
- [x] Custom key bindings via `?keymap=` URL param (JSON)
- [x] Separate press/release animation speeds (50ms/120ms)
- [x] `prefers-reduced-motion` support
- [x] CSP security headers
- [x] 3 rounds of Claude audit (40+ findings, all CRITICAL/HIGH resolved)
- [x] Installation guide with troubleshooting and keymap docs
- [x] README with features, quick start, roadmap
- [x] Reproducible packaging via `scripts/package.sh`

## Next Actions

1. **Real OBS test** with Input Overlay plugin (Windows/Linux desktop required)
2. Recruit 5+ beta testers
3. Build GBA theme (shoulder buttons L/R)
4. TypeScript/Vite monorepo migration (Phase A+)

## Known Limitations

- No automated tests (Vitest/Playwright) — single-file prototype
- `file://` WebSocket may require local HTTP server on some OBS versions
- macOS not supported (Input Overlay plugin is Windows/Linux only)
- Gamepad config not customizable via URL (keyboard only for now)

## Repo

https://github.com/willytop8/OBS-InputDisplay-GameBoy
