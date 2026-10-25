# Tulip Hardening 🌷🛡️

[Home](README.md) · [Install](INSTALL.md) · [Why Tulip](WHY-TULIP.md) · **Hardening**

---

Tulip uses a conservative kernel-hardening approach designed to make exploitation more difficult without turning security into a marketing claim.

Kernel hardening does **not** mean Tulip is unhackable or free from vulnerabilities. It means the kernel is configured with additional defensive layers intended to reduce attack opportunities, limit the impact of memory-safety bugs and make reliable exploitation harder.

## Why harden the kernel?

The Linux kernel runs at the most privileged level of the operating system. A serious kernel vulnerability can potentially affect the entire system. Hardening attempts to ensure that one bug does not automatically become an easy path to full compromise.

Tulip therefore follows a **defense-in-depth** approach: several independent protections are used together so an attacker may need to defeat multiple barriers instead of relying on one weakness.

## Security mechanisms used by Tulip

Tulip currently makes use of established Linux security capabilities such as:

- **Strong stack protection** — helps detect certain stack corruption and buffer-overflow conditions.
- **Strict kernel memory permissions (RWX)** — reduces situations where kernel memory is writable and executable at the same time.
- **KASLR** — randomizes kernel memory placement to make address prediction more difficult.
- **FORTIFY-style protections** — strengthens checks around selected memory and string operations.
- **Hardened userspace-to-kernel copy checks** — adds validation around data copied across the userspace/kernel boundary.
- **Slab allocator hardening and randomization** — makes some heap-exploitation techniques less predictable.
- **SELinux support** — provides a foundation for mandatory access-control policy when enabled by the operating system.
- **Module-signing support** — supports verification of trusted kernel modules.
- **fs-verity and dm-verity** — provide integrity-verification capabilities for files and block-device content.

## Conservative, not maximum-at-all-costs

Tulip deliberately does not enable every possible security mechanism simply to claim maximum hardening. Security settings are evaluated together with compatibility, reliability, toolchain requirements, performance and actual test evidence.

This means Tulip prefers:

```text
security improvement
+ compatibility
+ reliability
+ measurable evidence
```

over blindly enabling every available option.

## What hardening does not mean

Hardening does not mean:

- no vulnerabilities can exist
- malware is impossible
- every exploit is blocked
- Tulip is anonymous by default
- Tulip is universally more secure than every other Linux configuration

Instead, the intended result is simple:

> **Harder to exploit. Safer when things go wrong. Practical to run.**

Security is treated as an engineering property to be tested and maintained, not as a promise that compromise can never happen.

For the wider project rationale, see **[Why Tulip](WHY-TULIP.md)**.
