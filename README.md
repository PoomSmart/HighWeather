# HighWeather

An iOS 15 tweak that tries to enable VFX on Apple Weather app (animated clouds, raindrop with collisions, etc.) on some unsupported devices.

## Findings

- Feature locked away by device type check (bypassed in this tweak)
- VFX folder is missing from the Weather app downloaded from arm64e devices
- VFX folder contains ktx and heic files; HEIC may or may not be the key for VFX to work only on the devices [mentioned here](https://support.apple.com/en-us/HT207022)