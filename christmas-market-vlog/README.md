# Christmas Market Vlog

Raw clips filmed 15 Nov 2026, in shooting order.

| # | File | Time filmed | Length | Notes |
|---|------|-------------|--------|-------|
| 1 | `raw/01_PXL_20261115_172159189.mp4` | 17:21:59 | 4.9s | 1080p HEVC, 120fps |
| 2 | `raw/02_PXL_20261115_172246410.mp4` | 17:22:46 | 5.1s | 1080p HEVC |
| 3 | `raw/03_PXL_20261115_172948948.mp4` | 17:29:48 | 2.6s | 1080p HEVC, 30fps |

Total raw footage: ~12.6 seconds.

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
