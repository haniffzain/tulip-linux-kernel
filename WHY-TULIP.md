# Why Tulip? 🌷

[Home](README.md) · [Install](INSTALL.md) · **Why Tulip** · [Hardening](HARDENING.md)

---

Linux 7.3 Tulip keeps upstream Linux 7.3 as its implementation foundation and adds an explicit project policy around memory behaviour, hardening, integrity, validation and release evidence.

```text
Linux 7.3
+ Tulip policy
+ Tulip configuration
+ Tulip validation
+ Tulip release evidence
= Linux 7.3 Tulip
```

## Project directions

- **TulipMem** — MGLRU-focused memory policy
- **Tulip LowMem** — optional zram capability for low-memory systems
- **TulipSched** — upstream scheduler retained as the normal default
- **TulipGuard** — curated Linux hardening profile
- **TulipTrust** — integrity and trust capabilities
- **TulipSpeed** — measurement-first performance policy
- **TulipTest** — build, boot and configuration validation evidence

## What Tulip is trying to achieve

Tulip is not intended to replace upstream Linux or claim ownership of Linux kernel development. The project starts from an exact upstream Linux baseline and applies documented configuration, policy, validation and release-engineering choices on top of it.

The design preference is conservative: preserve upstream behaviour unless there is a clear reason to change policy, keep compatibility and reliability in view, and avoid claiming performance or security improvements that have not been demonstrated by evidence.

Tulip therefore focuses on four practical questions:

1. Can memory behaviour remain useful across both normal and low-memory systems?
2. Can established Linux security mechanisms be enabled in a practical, layered way?
3. Can kernel integrity and release provenance be easier to verify?
4. Can changes be measured and tested rather than assumed to be improvements?

Tulip does **not** currently claim to be universally faster or universally more secure than vanilla Linux 7.3.

For the detailed security rationale, continue to **[Hardening](HARDENING.md)**.

For a direct comparison with vanilla Linux 7.3, see **[docs/comparison.md](docs/comparison.md)**.
