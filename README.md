# Linux 7.3 Tulip — Public Releases 🌷

This repository is the **public release storefront** for Linux 7.3 Tulip.

Tulip is based directly on the upstream Linux kernel. It does not replace Linux or claim authorship of upstream Linux source.

## Current public release

### Linux 7.3 Tulip 2 Alpha 1

- Tag: `v7.3-tulip2-alpha1`
- Classification: **Pre-release / Alpha / Testing**
- Engineering source identity: `8286db800faf7af273757cecfde8261ae9af54a7`
- Upstream Linux baseline: `v7.3`
- Upstream commit: `c03c1a14507dfaf8b856c2608f9ac216021fc222`
- Internal kernel release: `7.3.0-tulip2-alpha1`

The GitHub release provides the kernel image, configuration, modules archive, full source archive, manifest and SHA-256 checksum file.

See [`releases/alpha1.md`](releases/alpha1.md) for release notes.

## Source and provenance

The public Alpha 1 source/provenance record is documented in:

### [`SOURCE-PROVENANCE.md`](SOURCE-PROVENANCE.md)

The release includes `tulip-7.3-tulip2-alpha1-source.tar.gz` and the exact release configuration. The upstream baseline can also be independently fetched and verified with:

```bash
./scripts/fetch-upstream-v7.3.sh
```

For Alpha 1, the recorded Tulip engineering delta from upstream Linux v7.3 consists of project documentation, configuration fragments and evidence reports; no upstream kernel source file modification is recorded by the repository comparison for the Alpha engineering commit.

## Important Alpha warning

Alpha 1 is not production-stable certification and has not been validated on every hardware platform supported by Linux.

When testing Tulip on a Linux system, keep the existing distribution kernel installed as a fallback.

## Repository roles

- This repository: public releases, source/provenance, licensing and release-facing documentation.
- Private engineering repository: development history and ongoing engineering work.
- The former public engineering repository `haniffzain/tulip-kernel` is retired from canonical use and should not be used as the source of future Tulip development or releases.

## License

See [`COPYING`](COPYING).

Tulip retains the Linux kernel licensing framework, including:

`GPL-2.0 WITH Linux-syscall-note`

Other licenses may apply to individual parts of the upstream Linux source tree according to Linux kernel licensing rules.

## Creator and maintainer

Creator and Maintainer: **haniffzain**  
Contact: `haniffsp@proton.me`

## Upstream attribution

Upstream Linux repository: `https://github.com/torvalds/linux.git`

Tulip remains a Linux-derived project and preserves upstream attribution.
