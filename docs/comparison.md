# Tulip vs Vanilla Linux 7.3 🌷

Tulip is a Linux kernel derivative based directly on upstream Linux `v7.3`.

Upstream baseline commit:

`c03c1a14507dfaf8b856c2608f9ac216021fc222`

Tulip does not claim authorship of upstream Linux source and does not attempt to replace Linux. Its goal is to keep the mature upstream foundation while making project-level configuration, hardening, integrity, memory-policy, validation and release choices explicit.

## In one line

```text
Linux 7.3
+ Tulip policy
+ Tulip configuration
+ Tulip validation
+ Tulip release evidence
= Linux 7.3 Tulip
```

## Comparison

| Area | Vanilla Linux 7.3 | Tulip 7.3 |
| --- | --- | --- |
| Foundation | Official upstream Linux | Directly based on upstream Linux 7.3 |
| Hardware/drivers | Broad upstream support | Preserves the upstream driver foundation as much as possible |
| Kernel source strategy | Upstream source | Alpha 1 records no upstream kernel source-file modification |
| Memory policy | Upstream mechanisms available | **TulipMem:** MGLRU as the normal baseline |
| Low-memory support | Upstream mechanisms available | Optional zram through **Tulip LowMem** |
| Scheduler | Upstream scheduler | **TulipSched:** upstream scheduler retained as default |
| Hardening | Linux hardening mechanisms available | **TulipGuard:** curated hardening profile |
| Integrity | Linux integrity mechanisms available | **TulipTrust:** module/filesystem/device integrity capabilities |
| Performance | General-purpose upstream policy | **TulipSpeed:** conservative, measurement-first policy |
| Validation | Linux upstream testing ecosystem | Additional Tulip build, QEMU, config and milestone evidence |
| Releases | Upstream Linux release model | Tulip tags, manifests, checksums, source/provenance records |

## Main practical advantages

### 1. Small divergence from upstream

Tulip deliberately avoids rewriting working Linux subsystems just to appear different.

That can make maintenance easier because the project stays close to the upstream Linux implementation and driver ecosystem.

### 2. Explicit project policy

Tulip records choices that might otherwise remain implicit or distribution-specific.

Examples include:

- MGLRU as the normal memory-policy baseline
- optional zram for low-memory systems
- zswap not forced as a default
- DAMON not forced as a default
- upstream scheduler retained rather than replaced without evidence

### 3. TulipGuard

TulipGuard documents a hardening policy built from established Linux mechanisms such as:

- strong stack protector
- strict kernel/module RWX protections
- KASLR
- `FORTIFY_SOURCE`
- hardened usercopy
- SLAB freelist randomization/hardening

Tulip does not claim to have invented these mechanisms; the value is in selecting and validating a coherent profile.

### 4. TulipTrust

Recorded integrity capabilities include:

- `CONFIG_MODULE_SIG`
- `CONFIG_FS_VERITY`
- `CONFIG_DM_VERITY`

A simple distinction is:

```text
TulipGuard -> constrain and harden behaviour
TulipTrust -> integrity and trust
```

### 5. TulipMem and LowMem

Tulip uses MGLRU as its normal memory-policy direction and supports optional zram for low-memory systems.

| RAM | Guidance |
| --- | --- |
| `<= 4 GB` | MGLRU + zram recommended |
| `4-8 GB` | MGLRU default; zram optional |
| `> 8 GB` | MGLRU default; zram normally disabled |

The project has QEMU runtime evidence for zram, but does not claim identical behaviour on every physical machine.

### 6. Conservative scheduler policy

TulipSched keeps the upstream Linux scheduler as the standard policy. There is no scheduler-core rewrite claim in the current line.

### 7. Measurement before performance claims

Tulip does not currently claim to be universally faster than vanilla Linux 7.3.

The rule is simple:

> Performance work is only meaningful when it is measured.

### 8. Stronger release traceability

Public Tulip releases are intended to carry clear identity and verification material such as:

- kernel image where provided
- release configuration
- modules archive where provided
- source archive
- manifest
- SHA-256 checksums
- exact upstream version and commit
- exact Tulip tag/engineering identity
- release limitations

## What Tulip does not claim

Tulip does not currently claim:

- to be an independently written kernel
- to replace upstream Linux
- to be universally faster than Linux 7.3
- to be universally more secure on every machine
- to have been physically certified on all hardware supported by Linux
- that QEMU validation is equivalent to broad physical-hardware certification

## Why this approach matters

The project principle is:

> Start with upstream Linux, change only with a reason, test what changed, preserve the evidence, and say exactly what the evidence proves.

For build and installation instructions, see [`../INSTALL.md`](../INSTALL.md).
