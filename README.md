# FreeFlow Dictation Homebrew tap

The Homebrew cask for [FreeFlow Dictation](https://freeflow.audio), on-device voice dictation for Apple Silicon Macs with a Claude Code hook. The cask installs the same Developer ID-signed, notarized DMG that [freeflow.audio/download](https://freeflow.audio/download) serves.

## Install

```bash
brew install --cask FreemanGT/tap/freeflow-dictation
```

Then open FreeFlow from `/Applications` once; macOS asks for the Microphone and Accessibility permissions it needs to record and to paste.

Requirements: Apple Silicon (arm64), macOS 14 Sonoma or later. 14-day full trial, then $99 once for three Macs.

## Update

FreeFlow updates itself (the cask declares `auto_updates true`), so `brew upgrade` leaves an installed copy alone. To force the cask's version:

```bash
brew upgrade --cask --greedy freeflow-dictation
```

## Uninstall

If you connected Claude Code, disconnect first (FreeFlow → Settings → Claude Code → Disconnect) so the hook entry leaves `~/.claude/settings.json`. Homebrew never edits that file. Then:

```bash
brew uninstall --cask freeflow-dictation
```

`brew uninstall --zap --cask freeflow-dictation` also removes `~/Library/Application Support/FreeFlow` (history, modes, dictionary, log) and the per-bundle caches. The read-aloud voice under `~/.cache/fluidaudio/Models/` is shared with other FluidAudio apps and is left alone.

If the app is removed without disconnecting, nothing breaks: the hook helper path goes stale and every hook yields in under a second, so Claude Code asks in its own window as usual.

## Links

- Website: https://freeflow.audio
- Download page: https://freeflow.audio/download
- Privacy (every network call the app makes): https://freeflow.audio/privacy
- Changelog: https://freeflow.audio/changelog
- Support: support@freeflow.audio
