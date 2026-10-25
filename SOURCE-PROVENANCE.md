# Tulip Alpha 1 Source Provenance

This document records the public source/provenance basis for **Linux 7.3 Tulip 2 Alpha 1**.

## Release identity

- Public release tag: `v7.3-tulip2-alpha1`
- Tulip engineering commit represented by the release: `8286db800faf7af273757cecfde8261ae9af54a7`
- Upstream Linux tag: `v7.3`
- Exact upstream Linux commit: `c03c1a14507dfaf8b856c2608f9ac216021fc222`
- Internal kernel release: `7.3.0-tulip2-alpha1`

The public storefront repository is intentionally separate from the private engineering repository. The storefront tag identifies the public release record; the engineering commit above identifies the Tulip source state used for the Alpha 1 release.

## Source relationship to upstream Linux 7.3

A repository comparison between upstream Linux v7.3 (`c03c1a14507dfaf8b856c2608f9ac216021fc222`) and the Tulip Alpha 1 engineering commit (`8286db800faf7af273757cecfde8261ae9af54a7`) records 21 Tulip commits.

For Alpha 1, those commits add Tulip project documentation, configuration fragments and evidence reports. The comparison does **not** record modifications to upstream Linux kernel source files.

Accordingly, the kernel source foundation for Alpha 1 is upstream Linux v7.3 at the exact commit recorded above, combined with the published Tulip configuration used for the release.

## Public release assets

The GitHub Alpha 1 release publishes:

- `tulip-7.3-tulip2-alpha1-bzImage`
- `tulip-7.3-tulip2-alpha1.config`
- `tulip-7.3-tulip2-alpha1-modules.tar.gz`
- `tulip-7.3-tulip2-alpha1-source.tar.gz`
- `MANIFEST.txt`
- `SHA256SUMS`

GitHub records the uploaded source archive with:

- size: `269738989` bytes
- SHA-256 digest: `da9d84ae57f7b7b2b42f316d15f198777d6e16cf82cef673b0c5ca2fe8cfc69b`

The release configuration asset is also published separately so the build configuration used by the release is not dependent on the binary image alone.

## Reconstructing the upstream source

The repository includes `scripts/fetch-upstream-v7.3.sh`. It clones the official Linux repository, checks out `v7.3`, and refuses to continue if the resulting commit is not exactly:

`c03c1a14507dfaf8b856c2608f9ac216021fc222`

This provides an independent path to obtain and verify the upstream source baseline.

## Licensing

Tulip remains derived from the Linux kernel and retains the Linux kernel licensing framework. See `COPYING` and the license files contained in the Linux source tree.

The top-level kernel license identifier is:

`GPL-2.0 WITH Linux-syscall-note`

## Retirement-audit conclusion

For the purpose of the Tulip repository migration/retirement checklist, the public Alpha 1 release has:

- an identified upstream source baseline,
- an exact upstream commit,
- an exact Tulip engineering commit,
- a public full source archive asset,
- a public release configuration,
- public manifest/checksum assets,
- public Linux licensing notice,
- and a deterministic upstream-fetch verification script.

This is recorded as a **technical corresponding-source/provenance PASS for the Tulip retirement gate**. It is an engineering record, not a legal certification or legal advice.
