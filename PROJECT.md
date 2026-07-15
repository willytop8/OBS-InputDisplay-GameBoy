# GB Input Display — Project Specification

## Mission

Build the community-standard Game Boy input display for OBS livestreaming. Easy to install, map, and theme. Works with keyboard and gamepad. Inspired by GameCube Game Boy Player visual language.

## Architecture

```
Physical Input → Input Adapter → Action Mapper → Normalized GB State → Transport → Theme Renderer
```

### Phase A (current): OBS Input Overlay preset pack
### Phase B (future): Standalone local overlay app
### Phase C (future): Community theme platform

## Canonical Action Model

```ts
type GameBoyAction = "up" | "down" | "left" | "right" | "a" | "b" | "start" | "select" | "l" | "r";

interface InputStateMessage {
  protocolVersion: 1;
  type: "input-state";
  timestamp: number;
  sequence: number;
  deviceId?: string;
  actions: Record<GameBoyAction, boolean>;
}
```

## Tech Stack

- TypeScript (strict)
- Vite (build)
- HTML/CSS/SVG (renderer)
- Zod (validation)
- Vitest (tests)
- Playwright (visual tests)

## Product Principles

1. Install-to-visible-inputs under 5 minutes
2. No account, cloud, or internet required
3. Never interfere with emulator input
4. No perceptible latency
5. Survives focus changes and long sessions
6. Readable at small sizes
7. Keyboard + controller both first-class
8. Data-driven themes
9. Original, legally distributable assets
10. Portable, human-readable config
