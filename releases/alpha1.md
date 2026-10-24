# Linux 7.3 Tulip - Alpha 1 (Pre-release)

Status: PRE-RELEASE / ALPHA / TESTING

This release is not stable and is not recommended for production-critical systems.

Creator and maintainer: haniffzain
Contact: haniffsp@proton.me

Current release commit/tag:
v7.3-tulip2-alpha1
8286db800faf7af273757cecfde8261ae9af54a7

Upstream:
Linux v7.3
c03c1a14507dfaf8b856c2608f9ac216021fc222

Internal kernel release:
7.3.0-tulip2-alpha1

Assets:
- tulip-7.3-tulip2-alpha1-bzImage
- tulip-7.3-tulip2-alpha1.config
- tulip-7.3-tulip2-alpha1-modules.tar.gz
- tulip-7.3-tulip2-alpha1-source.tar.gz
- MANIFEST.txt
- SHA256SUMS

Verification:
- Tulip LowMem runtime FULL_RUNTIME_PASS in QEMU
- TulipGuard/TulipTrust configurations built
- Existing QEMU boot tests passed
- Kernel version verified in guest

Limitations:
- QEMU-focused validation
- No broad physical-hardware certification
- Benchmark evidence is limited and inconclusive
- Source package archive corresponds to the engineering tag only
