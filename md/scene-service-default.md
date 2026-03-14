# Scene: Service-Default

This is a backup of the Behringer X32 mixer settings saved as a **scene**. A scene is a snapshot of every parameter on the console — think of it as a saved preset for a complete worship service.

The file uses **Open Sound Control (OSC)** format — a network-friendly protocol that addresses every parameter on the mixer using a path that looks like a folder structure (e.g. `/ch/01/eq`). Each line is one setting: the path identifies *what* to set, and the values after it describe *how*.

---

## How to Read the File

```
/ch/01/config "Praise Mic 1" 50 YE 29
│      │       │              │   │  └─ headamp index (physical input on the stage box)
│      │       │              │   └──── color label on the console (Yellow)
│      │       │              └──────── icon number shown on screen
│      │       └─────────────────────── channel name
│      └─────────────────────────────── sub-section (config, eq, dyn, mix…)
└────────────────────────────────────── channel 01
```

`-oo` means **negative infinity** (fully off / muted at that send).
`OFF` / `ON` toggles a feature on or off.

---

## Scene Name

**Service-Default** — the standard starting point for a Sunday worship service.

---

## Input Channels (CH01–CH32)

These are the 32 microphone and instrument inputs.

| Channel | Name | Notes |
|---|---|---|
| CH01 | Praise Mic 1 | Yellow wireless — compressor & EQ active |
| CH02 | Praise Mic 2 | Blue wireless |
| CH03 | Praise Mic 3 | Green wireless |
| CH04 | Praise Mic 4 | Red wireless |
| CH05 | Praise Mic 5 | White wireless |
| CH06 | Keyboard | No phantom power (line level) |
| CH07 | E-Guitar | Compressor off |
| CH08 | Guitar | Acoustic guitar |
| CH09 | Bass | |
| CH10 | Kick Drum | Insert active (pre-fader), compression heavy |
| CH11 | Drums SL | Stage left overhead/mic |
| CH12 | Drums SR | Stage right overhead/mic |
| CH13 | Cajon | Gate set to filter with high-pass |
| CH14 | Vocal 6 | Inverted green — likely choir area |
| CH15 | Vocal 7 | Inverted yellow |
| CH16 | Grand Piano | |
| CH17–CH20 | Floor Mic 1–4 | Audience/choir floor mics — Yellow, Blue, Green, Red |
| CH21 | Pastor Craig | Compressor and EQ tuned for speech |
| CH22 | Pastor Wendy | Compressor with low-cut filter on dynamics |
| CH23 | Purple | Wireless — hard-panned full left in mains |
| CH24 | Orange | Wireless — hard-panned full right in mains |
| CH25 | Pulpit | Fixed podium mic |
| CH26 | Choir 1 | SR choir mic |
| CH27 | Choir 2 | SC choir mic — delay ON (22.2 ms for time-alignment) |
| CH28 | Choir 3 | SL choir mic |
| CH29–CH30 | (Unused) | No name assigned |
| CH31 | Congre-HL | Congregation mic — hard-panned left |
| CH32 | Congre-HR | Congregation mic — hard-panned right |

### What each sub-section means

| Sub-section | What it controls |
|---|---|
| `config` | Name, icon, color, and which physical input it uses |
| `delay` | Short delay (in ms) — used to time-align speakers |
| `preamp` | Gain level, phantom power (48V), high-pass filter |
| `gate` | Noise gate — silences the channel when no signal is present |
| `dyn` | Compressor — keeps loud sounds from getting too loud |
| `eq` | 4-band equalizer — shapes the tone (boosts or cuts certain frequencies) |
| `mix` | Fader level for the main output and all 16 mix buses |
| `grp` | Which DCA group and mute group this channel belongs to |
| `automix` | Automatic gain sharing between open mics |

---

## Aux Inputs (AX01–AX06)

These are playback and device inputs connected to the board's local inputs.

| Input | Name | Notes |
|---|---|---|
| AX01 | Presentation PC | EQ active — treble and mids rolled off |
| AX02 | Device | General purpose audio device |
| AX03 | Audience SR | Audience area mic (used for streaming/recording) |
| AX04 | Mobile | Mobile device input |
| AX05 | CD (L) | CD player — gain reduced -8 dB, panned left |
| AX06 | CD (R) | CD player — panned right |
| AX07 | USB L | On-board USB playback — left |
| AX08 | USB R | On-board USB playback — right |

---

## Mix Buses (BUS 01–BUS 16)

Mix buses are sub-mixes sent to specific destinations (monitors, streaming, etc.). Each channel can send a different level to each bus independently.

| Bus | Name | Purpose |
|---|---|---|
| BUS 01 | Choir | Choir speaker mix — routed through FX7 |
| BUS 02 | Gathering | Gathering Space speaker mix |
| BUS 03 | Streaming | Online streaming mix |
| BUS 04 | *(unnamed)* | Active compressor, FX6 insert — likely a speaker processing bus |
| BUS 07 | Cantata | Special purpose (cantata/special event) |
| BUS 08 | Drums SL+SR | Drums submix |
| BUS 09 | PastorMics | Pastor mic group bus |
| BUS 10 | Other Mics | Other microphone group bus |
| BUS 11 | Pr.Mics 6+7 | Praise mics 6 & 7 combined |
| BUS 12 | All Devices | All playback devices combined |
| BUS 05, 06, 13–16 | *(unused)* | Not assigned |

---

## Main Stereo Output

The **main stereo output** (`/main/st`) is what goes to the house speakers.

- 6-band EQ is active with significant shaping (cuts in the low-mid and upper-mid ranges)
- Compressor is active at -13 dB threshold
- FX8 (a graphic EQ) is inserted pre-fader for final house tuning
- Fader at +1.5 dB

---

## DCA Groups

DCA (Digitally Controlled Amplifier) groups allow a single fader to control many channels at once. Think of them as "master volume knobs" for a group of inputs.

| DCA | Label | Controls |
|---|---|---|
| DCA 1 | Pastor Craig | CH21 |
| DCA 2 | Pastor Wendy | CH22 |
| DCA 3 | Purple | CH23 |
| DCA 4 | Orange | CH24 |
| DCA 5 | Pulpit | CH25 |
| DCA 6 | Projector | Presentation/projection audio |
| DCA 7 | Choir | CH26–CH28 |
| DCA 8 | Device | Playback devices |

---

## Effects Processors (FX 1–8)

The X32 has 8 built-in effects slots.

| FX | Type | Source | Purpose |
|---|---|---|---|
| FX 1 | VRM (Virtual Room Modeler) | BUS 13 send | Room ambience effect |
| FX 2 | HALL reverb | BUS 14 send | Reverb for vocals/instruments |
| FX 3 | DLY (Stereo Delay) | BUS 15 send | Echo/delay effect |
| FX 4 | CRS (Chorus) | BUS 16 send | Chorus/shimmer effect |
| FX 5 | GEQ2 (Dual Graphic EQ) | — | Available for monitor EQ |
| FX 6 | GEQ2 (Dual Graphic EQ) | — | Inserted on BUS 04 |
| FX 7 | GEQ2 (Dual Graphic EQ) | — | Inserted on BUS 01 (Choir IEM) |
| FX 8 | GEQ (Graphic EQ) | — | Inserted on main stereo output |

To use effects, a channel sends signal to the FX bus (e.g. BUS 14 for reverb) and the processed sound returns via the corresponding FX return channel.

---

## P16 UltraNet Outputs (In-Ear Monitors)

The 16 P16 outputs feed the personal monitor mixers (Behringer P-16M units) worn by musicians.

Outputs 01–09 carry individual channel sources (post-EQ). Outputs 10–16 carry bus/group mixes. This matches the in-ear monitor mapping in [in-ear-monitors.md](in-ear-monitors.md).

---

## Physical Outputs

| Output | Source | Destination |
|---|---|---|
| OUT 01 | BUS 04 | Speaker processing |
| OUT 02 | BUS 05 | |
| OUT 03 | BUS 06 | |
| OUT 04 | BUS 07 | Cantata feed |
| OUT 07 | Main L | House speakers left |
| OUT 08 | Main R | House speakers right |
| OUT 09 | BUS 12 (All Devices) | |

---

## Headamp Gains (`/headamp/`)

These are the physical preamp gain settings on the three stage boxes (SD16 and two SD08 units). The index numbers (000–127) map to specific physical XLR inputs across all connected stage boxes. Phantom power (`ON`) is enabled for condenser microphones and wireless receivers.

---

## Key Terms Glossary

| Term | Meaning |
|---|---|
| **dB** | Decibel — unit of audio level. 0 dB is unity (no change). Positive = louder, negative = quieter. |
| **-oo** | Negative infinity — channel is fully silent at that point in the signal path |
| **PRE / POST** | Whether a send happens before (PRE) or after (POST) the channel fader |
| **PEQ** | Parametric EQ band — adjustable frequency, gain, and width |
| **HShv / LShv** | High/Low Shelf EQ — boosts or cuts all frequencies above/below a point |
| **LCut / HCut** | Low/High Cut filter (also called high-pass / low-pass) — removes bass or treble |
| **Gate** | Noise gate — automatically mutes a channel when it falls below a threshold level |
| **Compressor** | Reduces the dynamic range — makes loud sounds quieter so levels are more consistent |
| **Insert** | Puts an FX processor directly in the channel's signal path |
| **DCA** | Group fader that controls multiple channels without changing their individual mix sends |
| **Phantom 48V** | 48-volt power sent to a condenser microphone through the XLR cable |
| **AES50** | Digital audio protocol used to connect the X32 to the SD16/SD08 stage boxes |
| **UltraNet** | Behringer's personal monitoring protocol used with P-16 in-ear monitor systems |
