# Christmas Market Vlog

Raw clips filmed 15 Nov 2026, in shooting order.

| # | File | Time filmed | Length | What it shows |
|---|------|-------------|--------|---------------|
| 1 | `raw/01_PXL_20261115_152140885.mp4` | 15:21:40 | 4.8s | The Dickens Inn from outside (daytime) |
| 2 | `raw/02_PXL_20261115_153052611.mp4` | 15:30:52 | 4.9s | Inside the Dickens Inn: beams, old sign, Christmas decorations |
| 3 | `raw/03_PXL_20261115_164348019.mp4` | 16:43:48 | 5.2s | Food at the Dickens Inn: fish and chips, salad, kids' chips and peas |
| 4 | `raw/04_PXL_20261115_170849155.mp4` | 17:08:49 | 4.9s | Walking through the market stalls |
| 5 | `raw/05_PXL_20261115_170942328.mp4` | 17:09:42 | 5.6s | Market stalls: phone box, post box, carol singers, mulled wine |
| 6 | `raw/06_PXL_20261115_171051707.mp4` | 17:10:51 | 3.5s | The Galeón Andalucía |
| 7 | `raw/07_PXL_20261115_172159189.mp4` | 17:21:59 | 4.9s | Hot chocolate stall |
| 8 | `raw/08_PXL_20261115_172246410.mp4` | 17:22:46 | 5.1s | Selfie at the market |
| 9 | `raw/09_PXL_20261115_172324092.mp4` | 17:23:24 | 5.5s | Christmas trees and lights |
| 10 | `raw/10_PXL_20261115_172336071.mp4` | 17:23:36 | 6.2s | Looking down at the pavement and pushchair |
| 11 | `raw/11_PXL_20261115_172948948.mp4` | 17:29:48 | 2.6s | The hot chocolate |

Total raw footage: ~53 seconds. Still to come: you in the car with the kids (opener). Optional: a second galleon shot.

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
