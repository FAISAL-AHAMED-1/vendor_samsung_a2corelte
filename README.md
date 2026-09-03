# vendor/samsung/a2corelte

Proprietary vendor blobs for the Samsung Galaxy A2 Core (`a2corelte`).

## Provenance
Extracted directly from a **genuine stock vendor partition** dump
(`stock_vendor.img`), fingerprint:
```
samsung/a2coreltedd/a2corelte:8.1.0/OPR6/A260GDDSCAUJ1:user/release-keys
```
Converted from Android sparse format to raw ext4, then read with `debugfs`
(no mount/root needed). 358 regular files, 156 symlinks.

## What's here
- `proprietary/` — the actual extracted binaries (HAL services, `.so` libs,
  firmware, Trustonic `mcRegistry` blobs, `overlay/`, `media/`) with the
  original vendor build.prop and Treble `manifest.xml` / `compatibility_matrix.xml`
  also included for reference.
- `proprietary-files.txt` — flat listing of every blob (raw, unfiltered).
- `a2corelte-vendor.mk` — `PRODUCT_COPY_FILES` entries for every non-APK/JAR
  blob. This is the file you `inherit-product` from your device tree.
- `vendor.mk` — convenience wrapper, inherit this one.

## What's NOT done here (be aware before building)
- **No APK/JAR prebuilts** — none were found in this particular vendor dump
  (Go-edition minimal vendor image), so there's no `Android.mk` with signed
  prebuilt app stanzas. If a future dump of this device *does* have vendor
  apps, they need real `LOCAL_CERTIFICATE := PRESIGNED` Soong/make stanzas,
  not a raw file copy.
- **Not curated** — nothing here has been checked against what's already
  provided by AOSP/the platform. Some blobs may be redundant or unnecessary
  and should be trimmed once the build actually runs and you can see what's
  really missing vs. what's dead weight.
- Symlinks (156 of them, mostly `vndk-sp` versioned libs) are documented in
  `proprietary-files.txt` as comments but not recreated automatically —
  add them explicitly if the build complains about a missing linked lib.

## Wiring it in
In `device/samsung/a2corelte`'s product makefile (`omni_a2corelte.mk` or
similar), add:
```make
$(call inherit-product, vendor/samsung/a2corelte/vendor.mk)
```
