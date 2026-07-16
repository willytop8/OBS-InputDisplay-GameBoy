# GB Input Display — Installation Guide

**Install-to-visible-inputs in under 5 minutes.**

## What You Need

- OBS Studio 30.x or 31.x (Windows or Linux)
- [Input Overlay plugin](https://github.com/univrsal/input-overlay/releases) v5.0.5 (tested; newer versions may work but are unverified)
- GB Input Display preset (this zip file)

## Quick Setup (5 minutes)

### Step 1: Install Input Overlay

1. Download **Input Overlay** from [GitHub Releases](https://github.com/univrsal/input-overlay/releases)
2. Run the installer (Windows) or copy the plugin files (Linux)
3. Restart OBS Studio

### Step 2: Enable WebSocket Server

1. In OBS, go to **Tools → Input Overlay Settings**
2. Check **"Enable WebSocket server"**
3. Leave port as `16899` (default)
4. Click **OK**
5. Restart OBS (required after enabling WebSocket for the first time)

### Step 3: Add the Browser Source

1. In OBS, click **+** in the Sources panel
2. Select **Browser**
3. Name it "GB Input Display"
4. Set **URL** to: `file:///C:/path/to/gb-input-display/index.html` (or wherever you extracted the zip)
5. Set **Width** to `640` and **Height** to `200`
6. Check **"Refresh browser when scene becomes active"**
7. Click **OK**

### Step 4: Position the Overlay

1. Resize and position the overlay below your game footage
2. For speedrunning: align with the bottom of your layout
3. The overlay is transparent outside the faceplate — it won't cover game UI

### Step 5: Test It

1. Press **Arrow keys** (D-pad), **Z** (B), **X** (A), **Enter** (Start), **Right Shift** (Select)
2. Buttons should light up in OBS when pressed
3. If nothing happens: make sure Input Overlay WebSocket is enabled and OBS was restarted

## Default Keyboard Mapping

| Key | Game Boy Action |
|---|---|
| Arrow Up / W | Up |
| Arrow Down / S | Down |
| Arrow Left / A | Left |
| Arrow Right / D | Right |
| Z | B |
| X | A |
| Enter | Start |
| Right Shift / Backspace | Select |

## Gamepad Setup

1. Connect your controller before starting OBS
2. In OBS, go to **Tools → Input Overlay Settings**
3. Under "Gamepad Hook," click **Reload gamepads**
4. Select your controller
5. The overlay automatically maps: XInput A → GB B, XInput B → GB A, D-pad → GB D-pad

### Recommended Controller Mappings for Emulators

#### mGBA
- Configure in: **Tools → Settings → Controls**
- Map: Arrow keys or controller to emulator inputs
- The overlay reads from Input Overlay, not from the emulator — they work independently

#### BizHawk
- Configure in: **Config → Controllers**
- Map controller buttons to GB inputs
- BizHawk and the overlay don't interfere with each other

## Troubleshooting

### Buttons don't light up
1. Is Input Overlay installed and WebSocket enabled? (Tools → Input Overlay Settings)
2. Did you restart OBS after enabling WebSocket?
3. Are you pressing the right keys? Try Arrow keys + Z/X first
4. Check the status indicator in the bottom-right of the overlay:
   - "● connected" — WebSocket is working
   - "keyboard test mode" — WebSocket failed, using keyboard fallback

### Overlay looks wrong
1. Browser source width should be 640, height 200
2. Check "Refresh browser when scene becomes active"
3. The overlay is designed for transparent background — make sure no background color is set on the Browser source

### Controller not detected
1. Connect controller before starting OBS
2. In Input Overlay Settings, click "Reload gamepads"
3. Make sure the gamepad hook is enabled
4. XInput controllers (Xbox, 8BitDo in XInput mode) work best

### Overlay covers my game
1. The faceplate is semi-transparent at the edges — position it below game footage
2. Resize the browser source smaller (the SVG is responsive)
3. The outer area is fully transparent

## Uninstall

1. Remove the Browser Source from your OBS scene
2. Optionally: disable WebSocket in Input Overlay Settings
3. Delete the extracted folder

## Custom Key Bindings

You can override the default keyboard mapping without editing the source:

```
?keymap={"KeyCode":"action","KeyCode2":"action2"}
```

**Example** — remap to IJKL (movement) + Q/W (A/B) + Space (Start) + Shift (Select):

```
?keymap={"KeyI":"up","KeyK":"down","KeyJ":"left","KeyL":"right","KeyQ":"a","KeyW":"b","Space":"start","ShiftLeft":"select"}
```

**Full URL example in OBS Browser Source:**

```
file:///C:/path/to/gb-input-display/index.html?theme=dmg&keymap={"KeyI":"up","KeyK":"down","KeyJ":"left","KeyL":"right","KeyQ":"a","KeyW":"b","Space":"start","ShiftLeft":"select"}
```

**Valid action names:** `up`, `down`, `left`, `right`, `a`, `b`, `start`, `select`

**Key code names:** Use the [KeyboardEvent.code](https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_code_values) values (e.g., `ArrowUp`, `KeyX`, `Space`, `ShiftLeft`, `Digit1`).

**Multiple keys per action:** Just map multiple keys to the same action:
```json
{"ArrowUp":"up","KeyW":"up","Numpad8":"up"}
```

Note: OBS Browser Source may have issues with special characters in URLs. If the JSON doesn't parse, try URL-encoding the `keymap` value.

## Need Help?

- [GitHub Issues](https://github.com/willytop8/Obs-InputDisplay-GameBoy/issues)
- Input Overlay plugin docs: [univrsal/input-overlay Wiki](https://github.com/univrsal/input-overlay/wiki/Usage)
