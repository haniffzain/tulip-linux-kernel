# Linux 7.3 Tulip — Frequently Asked Questions 🌷

This FAQ answers the most common questions about Tulip, its relationship with upstream Linux, installation, releases, hardware compatibility and project policy.

---

## 1. What is Linux 7.3 Tulip?

Tulip is a Linux kernel derivative based directly on upstream Linux `v7.3`.

It keeps upstream Linux as the implementation foundation and adds a documented Tulip policy around configuration, memory behaviour, hardening, integrity, validation and release evidence.

A simple way to describe the project is:

```text
Linux 7.3
+ Tulip policy
+ Tulip configuration
+ Tulip validation
+ Tulip release evidence
= Linux 7.3 Tulip
```

---

## 2. Is Tulip a completely new kernel written from scratch?

No.

Tulip is **not** an independently written kernel and does not claim authorship of upstream Linux source.

Tulip is derived directly from Linux and intentionally preserves that foundation rather than rewriting mature kernel subsystems merely to appear different.

---

## 3. Which upstream Linux version does Tulip use?

The current Tulip generation is based on:

- Upstream Linux tag: `v7.3`
- Exact upstream commit: `c03c1a14507dfaf8b856c2608f9ac216021fc222`

See [`UPSTREAM.md`](UPSTREAM.md) and [`SOURCE-PROVENANCE.md`](SOURCE-PROVENANCE.md).

---

## 4. What is different from vanilla Linux 7.3?

Tulip adds a more explicit project policy around the upstream kernel rather than attempting a broad source rewrite.

The current engineering areas include:

- **TulipMem** — MGLRU-focused memory policy
- **Tulip LowMem** — optional zram capability for low-memory systems
- **TulipSched** — conservative scheduler policy using the upstream scheduler as the normal default
- **TulipGuard** — curated Linux hardening configuration
- **TulipTrust** — integrity and trust capabilities
- **TulipSpeed** — performance changes must be measured before performance claims are made
- **TulipTest** — additional build, boot, configuration and release validation evidence

For a detailed table, see [`docs/comparison.md`](docs/comparison.md).

---

## 5. Is Tulip faster than vanilla Linux 7.3?

Tulip does **not** currently claim to be universally faster than vanilla Linux 7.3.

Performance depends on hardware, workload, configuration, compiler, storage, memory pressure and many other factors. Tulip therefore follows a measurement-first rule: performance claims require controlled evidence.

A configuration may be better for one workload without being better for every system.

---

## 6. Is Tulip more secure than vanilla Linux?

Tulip enables and documents a curated hardening and integrity policy through areas such as TulipGuard and TulipTrust.

That can provide a more explicit security posture for the project, but Tulip does **not** claim that every Tulip system is automatically more secure than every vanilla Linux system.

Security still depends on configuration, userspace, firmware, updates, hardware, administrator practice and the complete operating-system environment.

---

## 7. Did Tulip invent MGLRU, zram, kernel hardening or verity?

No.

Those mechanisms come from Linux and the wider Linux ecosystem. Tulip's contribution is in selecting, combining, documenting and validating a Tulip-specific policy around existing upstream capabilities.

Upstream attribution is intentionally preserved.

---

## 8. Does Tulip keep Linux 7.3 drivers?

Tulip is based directly on the Linux 7.3 source generation, so it inherits the upstream Linux 7.3 driver base.

However, that does not mean Tulip has been physically tested on every device supported by Linux. Hardware compatibility must still be validated on the target machine.

---

## 9. Has Tulip been tested on every processor and computer supported by Linux?

No.

Tulip has recorded build and QEMU validation, including project-specific testing, but that is not the same as certification on every physical CPU, motherboard, GPU, storage controller, network device or peripheral supported by upstream Linux.

Broader physical-hardware testing is part of the Alpha validation process.

---

## 10. What is TulipMem?

TulipMem is the project's memory-policy direction.

The current baseline uses MGLRU as the normal memory-management policy foundation. Tulip LowMem adds optional zram capability for systems where compressed RAM swap may be useful.

---

## 11. What is Tulip LowMem?

Tulip LowMem is an optional low-memory profile built around MGLRU with optional zram support.

Current project guidance is broadly:

| System RAM | Guidance |
| --- | --- |
| `<= 4 GB` | MGLRU + zram recommended |
| `4–8 GB` | MGLRU default, zram optional |
| `> 8 GB` | MGLRU default, zram normally disabled |

This is project guidance, not a guarantee that the same configuration is optimal for every workload.

---

## 12. Why is zram optional instead of always enabled?

Because zram trades CPU work and RAM usage for compressed swap capacity.

That can be valuable under memory pressure, especially on smaller systems, but it is not automatically beneficial for every desktop, workstation or server. Tulip therefore treats it as a capability rather than forcing it universally.

---

## 13. What is TulipSched?

TulipSched represents the project's scheduler policy.

The normal Tulip policy keeps the upstream Linux scheduler rather than performing a scheduler-core rewrite without strong evidence that such a change is needed.

This follows a simple Tulip principle: **more patches do not automatically mean a better kernel**.

---

## 14. What is TulipGuard?

TulipGuard is the project's curated hardening profile using established Linux security mechanisms.

Recorded areas include stack protection, strict kernel/module RWX protections, KASLR, FORTIFY, hardened usercopy and SLAB hardening/randomization where supported by the chosen configuration and toolchain.

---

## 15. What is TulipTrust?

TulipTrust focuses on integrity and trust capabilities.

Recorded project capabilities include areas such as module signing support, fs-verity and dm-verity.

A useful distinction is:

```text
TulipGuard → constrain and harden behaviour
TulipTrust → integrity and trust mechanisms
```

---

## 16. What is the difference between Tulip 1 and Tulip 2 Alpha 1?

### Tulip 1

- Tag identity: `v7.3-tulip1`
- Audited release commit: `3a4ae31d5515b378e08a907ee6618eca185ef953`
- Classification: audited baseline release
- Historical milestone state: `M0-M20 PASS VERIFIED`

### Tulip 2 Alpha 1

- Tag: `v7.3-tulip2-alpha1`
- Engineering source identity: `8286db800faf7af273757cecfde8261ae9af54a7`
- Classification: pre-release / Alpha / testing
- Internal kernel release: `7.3.0-tulip2-alpha1`

See [`releases/tulip1.md`](releases/tulip1.md) and [`releases/alpha1.md`](releases/alpha1.md).

---

## 17. Is Tulip 2 Alpha 1 suitable for production-critical systems?

It should be treated as an **Alpha testing release**, not as broad production certification.

Users testing Alpha 1 should keep a known-good distribution kernel installed and available from the bootloader.

---

## 18. How do I install Tulip?

Start with [`INSTALL.md`](INSTALL.md).

The safe general flow is:

1. keep the existing distribution kernel installed
2. obtain the Tulip release/source and exact configuration
3. build the kernel and modules
4. install Tulip alongside the existing kernel
5. generate/update the initramfs where required
6. update the bootloader
7. reboot into Tulip
8. verify the running kernel
9. keep the original kernel available for rollback

Do not replace the only known-good bootable kernel during the first Tulip test.

---

## 19. Do I need to remove my Ubuntu, Fedora, Arch or other distro kernel?

No.

For testing, Tulip should be installed **alongside** the existing distribution kernel. The original kernel is your recovery path if Tulip does not boot correctly on that machine.

---

## 20. How do I roll back if Tulip does not boot?

Boot the previous distribution kernel from your bootloader or recovery menu.

Then inspect the failed boot, kernel logs, initramfs, required drivers, Secure Boot state and any out-of-tree modules before trying again.

The rollback procedure is covered in [`INSTALL.md`](INSTALL.md).

---

## 21. Does Tulip support Secure Boot?

A locally built Tulip kernel may not automatically be trusted by firmware configured for Secure Boot.

The exact process depends on the Linux distribution and firmware setup. Users may need their distribution's kernel-signing/MOK workflow or equivalent key-management process.

Private signing keys should never be committed to a public repository.

---

## 22. What about NVIDIA, VirtualBox and other DKMS/out-of-tree modules?

Out-of-tree modules may need to be rebuilt for the exact Tulip kernel ABI.

A kernel can boot correctly while a separately maintained external module fails to build or load. Test such modules before making Tulip the preferred kernel on a machine that depends on them.

---

## 23. Where is Tulip source code?

The public release storefront provides source/provenance information and release assets.

For Alpha 1, the public GitHub release includes a corresponding source archive together with the release configuration, manifest and SHA-256 checksums.

The exact upstream Linux baseline is also documented so it can be independently fetched and verified.

See [`SOURCE-PROVENANCE.md`](SOURCE-PROVENANCE.md).

---

## 24. Why does the storefront not contain a second multi-gigabyte copy of the complete Linux Git history?

The storefront is intentionally a lightweight public release repository.

Upstream Linux remains the canonical source for the enormous inherited Linux history. Tulip records the exact upstream tag/commit, project configuration, release provenance and corresponding source assets needed for Tulip releases instead of pretending the entire Linux history is Tulip-authored work.

---

## 25. What license does Tulip use?

Tulip is Linux-derived and retains the Linux kernel licensing framework.

The repository records:

```text
GPL-2.0 WITH Linux-syscall-note
```

Individual files in the upstream Linux source may carry other compatible licenses according to the Linux kernel licensing framework.

See [`COPYING`](COPYING).

---

## 26. Why is the engineering repository private while the release storefront is public?

The roles are intentionally separated.

- **Private engineering repository** — development history, internal engineering work, milestone evidence and ongoing experimentation.
- **Public storefront** — releases, installation guidance, comparison, source/provenance, license, support and public-facing documentation.

The separation keeps the public release surface simpler without removing release-facing source and provenance information.

---

## 27. Will Tulip always stay on Linux 7.3?

No permanent promise is made to remain on Linux 7.3.

Future Tulip generations can move to a newer upstream Linux version, but the project intends to treat that as a controlled forward-port: verify the new upstream baseline, review configuration changes, rebuild, retest, remeasure and release again.

Tulip does not treat an upstream version bump as a simple rename.

---

## 28. Will Tulip update every time upstream Linux releases a new kernel?

Not necessarily.

Tulip prioritizes controlled validation over chasing every upstream version immediately. A future baseline should be adopted when the project is ready to review, build and validate it properly.

---

## 29. How are Tulip performance claims handled?

The rule is simple:

> **Measure first. Claim second.**

A successful build or boot is not proof of improved performance. A benchmark from one machine is not proof for every machine. Tulip therefore keeps performance claims bounded by the evidence actually collected.

---

## 30. How do I report a problem?

See [`SUPPORT.md`](SUPPORT.md) and [`SECURITY.md`](SECURITY.md).

When reporting a technical problem, useful information includes:

- Tulip release/version
- hardware model or relevant components
- distribution/userspace
- boot command line
- kernel log around the failure
- whether the original distro kernel works on the same machine
- whether Secure Boot or DKMS/out-of-tree modules are involved

Do not publicly post private keys, passwords, tokens or other secrets.

---

## 31. Can Tulip accept outside contributions?

Public release documentation can evolve over time, but contribution policy for engineering work should follow the project's published repository/support policy.

Until a formal contribution workflow is published, users should not assume that every proposed kernel patch will be accepted simply because it makes Tulip different from upstream Linux.

---

## 32. What is the main idea behind Tulip?

Tulip's core idea is deliberately modest:

> **Start with upstream Linux, change only with a reason, test what changed, preserve the evidence, and say exactly what the evidence proves — no more and no less.**

That philosophy is more important to the project than having the largest patch count.
