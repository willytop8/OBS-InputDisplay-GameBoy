# GB Input Display

**Show your Game Boy button presses live on stream.** Free, open-source, works in 5 minutes.

![Preview](docs/preview.png)

---

## What Is This?

When you're speedrunning a Game Boy game, your viewers want to see what buttons you're pressing. This tool puts a clean, realistic Game Boy on your stream that lights up exactly what you're pressing — D-pad, A, B, Start, Select — in real time.

It works as an overlay in [OBS Studio](https://obsproject.com/) (the free streaming software most streamers use). No account needed, nothing leaves your computer.

---

## What You Get

- **Looks like a real Game Boy, not a debug tool** — four themes to choose from
- **Buttons light up instantly** — no lag, press a button and it shows immediately
- **Works with keyboard or controller** — play however you want, even both at once
- **Transparent background** — place it anywhere in your stream layout
- **Completely offline** — no internet, no accounts, no cloud. Everything runs on your computer

### Available Themes

| Theme | Looks Like |
|---|---|
| **DMG** | Original gray Game Boy |
| **GBC** | Atomic Purple Game Boy Color |
| **GBA Glacier** | Translucent frost blue — GBA Glacier edition |
| **Player Silver** | Clean silver & blue (default) |
| **Minimal** | Buttons only, no console shell |

---

## Setup (5 Minutes)

You'll need [OBS Studio](https://obsproject.com/) installed first.

### Step 1: Install the Plugin

Download and install the [Input Overlay plugin](https://github.com/univrsal/input-overlay/releases). This is what tells OBS which keys and buttons you're pressing.

### Step 2: Turn On the WebSocket

1. In OBS, go to **Tools → Input Overlay Settings**
2. Check the box that says **"Enable WebSocket"**
3. Leave everything else as default

### Step 3: Add the Overlay to Your Scene

1. In OBS, click the **+** button under **Sources**
2. Choose **Browser**
3. Name it "Game Boy Input" and click OK
4. For **URL**, click **Browse** and pick `apps/overlay-renderer/index.html` from this folder
5. Set width to `320` and height to `240`
6. Click OK

### Step 4: Test It

Press the Arrow keys and Z / X on your keyboard. The buttons on the overlay should light up!

**Full setup guide with screenshots:** [docs/installation.md](docs/installation.md)

---

## Default Controls

| Button | Keyboard | Gamepad |
|---|---|---|
| ↑ Up | Arrow Up or W | D-pad Up |
| ↓ Down | Arrow Down or S | D-pad Down |
| ← Left | Arrow Left or A | D-pad Left |
| → Right | Arrow Right or D | D-pad Right |
| B | Z | Gamepad B |
| A | X | Gamepad A |
| Start | Enter | Start |
| Select | Right Shift | Select |

---

## Does It Work On My Computer?

| | Windows 10/11 | Linux | Mac |
|---|---|---|---|
| **OBS + Plugin** | ✅ Yes | ✅ Yes (X11) | ❌ Not yet |
| **GB Input Display** | ✅ Yes | ✅ Yes | ❌ Planned |

On Linux with Wayland, it works but may need extra setup. See the [installation guide](docs/installation.md) for details.

---

## Changing the Theme

Add `?theme=` to the URL in your Browser Source settings:

- `index.html?theme=dmg` — Original Game Boy gray
- `index.html?theme=gbc` — Atomic Purple
- `index.html?theme=gba-glacier` — GBA Glacier (translucent frost blue)
- `index.html?theme=player-silver` — Silver & blue (default)
- `index.html?theme=minimal` — Just the buttons

---

## What's Coming Next

- **More themes** — GBA, Game Boy Pocket
- **More consoles** — NES and SNES layouts
- **Better animations** — press effects, optional sounds
- **Mac support**
- **Theme creation guide** — make your own look

---

## Credits

- [Input Overlay plugin](https://github.com/univrsal/input-overlay) by univrsal
- GB Input Display by [Will Ricchiuti](https://github.com/willytop8)

## License

Code: MIT · Artwork: CC-BY 4.0

*Not affiliated with Nintendo. Game Boy is a trademark of Nintendo Co., Ltd.*
