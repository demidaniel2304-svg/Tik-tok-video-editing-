# Christmas Market Vlog

Raw clips filmed 15 Nov 2026, in shooting order.

| # | File | Time filmed | Length | What it shows |
|---|------|-------------|--------|---------------|
| 1 | `raw/01_PXL_20261115_170849155.mp4` | 17:08:49 | 4.9s | Walking through the market stalls |
| 2 | `raw/02_PXL_20261115_171051707.mp4` | 17:10:51 | 3.5s | The Galeón Andalucía |
| 3 | `raw/03_PXL_20261115_172159189.mp4` | 17:21:59 | 4.9s | Hot chocolate stall |
| 4 | `raw/04_PXL_20261115_172246410.mp4` | 17:22:46 | 5.1s | Selfie at the market |
| 5 | `raw/05_PXL_20261115_172324092.mp4` | 17:23:24 | 5.5s | Christmas trees and lights |
| 6 | `raw/06_PXL_20261115_172336071.mp4` | 17:23:36 | 6.2s | Looking down at the pavement and pushchair |
| 7 | `raw/07_PXL_20261115_172948948.mp4` | 17:29:48 | 2.6s | The hot chocolate |

Total raw footage: ~33 seconds. Still to come: car, Dickens Inn (outside, inside), fish and chips.

Running order: see `storyboard.html`.

## Final edit

`final/christmas-market-vlog_tiktok.mp4` — 12s, 1080×1920 vertical, for TikTok.

Order: selfie → hot chocolate stall → the hot chocolate, with 0.3s crossfades,
animated titles ("Come with me to a Christmas Market" / "First stop: Hot Chocolate" /
"The verdict: Worth the queue") and light falling snow. Original sound, levelled.

### Re-editing

The titles and snow are a HyperFrames project in `project/`. To change the text, edit
`project/index.html`, then:

```bash
cd project
./build-base.sh                     # stitch the raw clips (FFmpeg)
npx hyperframes render -q delivery -o ../final/christmas-market-vlog_tiktok.mp4
```
