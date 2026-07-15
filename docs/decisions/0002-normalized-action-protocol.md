# ADR 0002: Normalized Action Protocol

**Date:** 2026-07-11
**Status:** Accepted

## Context

The Input Overlay plugin sends raw device events (keyboard key codes, gamepad button indices, analog stick positions) over its WebSocket. Our renderer needs to map these to Game Boy-specific actions. The handoff specifies a canonical action model:

```ts
type GameBoyAction = "up" | "down" | "left" | "right" | "a" | "b" | "start" | "select" | "l" | "r";
```

## Decision

**Use the handoff's canonical action model and state-message protocol exactly as specified.**

The renderer will:
1. Receive raw Input Overlay JSON from the WebSocket
2. Map keyboard key codes and gamepad button indices to `GameBoyAction` values using a configurable mapping profile
3. Maintain a local `Record<GameBoyAction, boolean>` state object
4. Render SVG elements based on `data-action` attributes matching action names

## Protocol

**State message** (primary consumption format):

```ts
interface InputStateMessage {
  protocolVersion: 1;
  type: "input-state";
  timestamp: number;
  sequence: number;
  deviceId?: string;
  actions: Record<GameBoyAction, boolean>;
}
```

**Event message** (optional, for discrete press/release tracking):

```ts
interface InputEventMessage {
  protocolVersion: 1;
  type: "input-event";
  timestamp: number;
  sequence: number;
  deviceId?: string;
  action: GameBoyAction;
  state: "pressed" | "released";
}
```

## Mapping

Default keyboard mapping (Pokémon speedrun standard):

| Key | Action |
|---|---|
| ArrowUp / W | up |
| ArrowDown / S | down |
| ArrowLeft / A | left |
| ArrowRight / D | right |
| X | a |
| Z | b |
| Enter | start |
| ShiftRight / Backspace | select |

Configurable via JSON profile. Multiple physical inputs can map to one action (e.g., both ArrowUp and W → up).

## Consequences

- Clean separation between input capture (Input Overlay plugin) and rendering (our code)
- Mapping is human-readable and portable (JSON profiles)
- Theme SVG elements only need `data-action` attributes — no device-specific knowledge
- Future Phase B standalone helper can emit the same protocol, making themes forward-compatible
