# Linux 7.3 Tulip 1

Status: AUDITED BASELINE RELEASE

Tulip 1 is the first audited Linux 7.3 Tulip release line.

## Identity

- Tag: `v7.3-tulip1`
- Release commit: `3a4ae31d5515b378e08a907ee6618eca185ef953`
- Upstream Linux baseline: `v7.3`
- Upstream commit: `c03c1a14507dfaf8b856c2608f9ac216021fc222`
- Historical milestone state: `M0-M20 PASS VERIFIED`

## What this release represents

Tulip 1 records the completed original Tulip 7.3 milestone sequence and serves as the audited baseline before the Tulip 2 Alpha line.

The project keeps upstream Linux as the implementation foundation and records Tulip-specific policy, configuration, hardening, integrity, testing and release evidence around it.

## Main project components

- TulipMem
- TulipSched
- TulipGuard
- TulipTrust
- TulipSpeed
- TulipTest
- performance regression checkpoint
- reproducibility/release evidence
- QEMU validation
- recovery and provenance records

## Installation

For current installation guidance, see [`../INSTALL.md`](../INSTALL.md).

Keep the existing distribution kernel installed as a fallback while testing any custom Tulip kernel build.

## Comparison

For the difference between Tulip and vanilla Linux 7.3, see [`../docs/comparison.md`](../docs/comparison.md).

## License and attribution

Tulip remains derived from the Linux kernel and retains the Linux kernel licensing framework.

See [`../COPYING`](../COPYING) and [`../UPSTREAM.md`](../UPSTREAM.md).

Tulip does not claim authorship of upstream Linux source.
