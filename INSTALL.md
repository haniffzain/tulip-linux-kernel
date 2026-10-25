# Installing Linux 7.3 Tulip 🌷

[Home](README.md) · **Install** · [Why Tulip](WHY-TULIP.md) · [Hardening](HARDENING.md)

---

Tulip is distributed as a source-oriented Linux kernel release. Keep your existing distribution kernel installed while testing Tulip so you always have a known-good fallback.

## Before you begin

You need a working Linux system with the normal kernel build toolchain for your distribution.

Tulip Alpha 1 is based on upstream Linux `v7.3` and uses the Tulip configuration profile supplied with the release.

> **Important:** never replace your only working kernel while testing an Alpha release.

## Option A — use the public release assets

For Alpha 1, open the GitHub release:

`v7.3-tulip2-alpha1`

The release provides:

- `tulip-7.3-tulip2-alpha1-bzImage`
- `tulip-7.3-tulip2-alpha1.config`
- `tulip-7.3-tulip2-alpha1-modules.tar.gz`
- `tulip-7.3-tulip2-alpha1-source.tar.gz`
- `MANIFEST.txt`
- `SHA256SUMS`

Verify the downloaded files against `SHA256SUMS` before installing.

## Option B — build from source

### 1. Obtain the source

Use the Tulip source archive supplied with the release, or independently fetch the exact upstream Linux baseline documented in `UPSTREAM.md`.

For Alpha 1 the upstream baseline is:

```text
Linux v7.3
c03c1a14507dfaf8b856c2608f9ac216021fc222
```

### 2. Start from a known-good kernel configuration

Use the configuration from the currently working distribution kernel when possible.

Examples:

```bash
cp /boot/config-$(uname -r) .config
```

or use the full Tulip release configuration supplied as:

```text
tulip-7.3-tulip2-alpha1.config
```

If you are using a Tulip config fragment from the engineering project rather than the full release `.config`, merge it into a complete kernel configuration first. Do not use a fragment as the entire `.config`.

### 3. Normalize the configuration

Run:

```bash
make olddefconfig
```

Review the resulting configuration before building.

### 4. Build

A common native build is:

```bash
make -j"$(nproc)"
```

Then build/install modules as appropriate for your system.

### 5. Install modules

Usually:

```bash
sudo make modules_install
```

### 6. Install the kernel

On systems where the kernel build system supports it:

```bash
sudo make install
```

Distribution-specific tooling may be preferable. The exact initramfs and bootloader workflow differs between Ubuntu/Debian, Fedora, Arch and other distributions.

### 7. Generate/update initramfs

Examples vary by distribution. Use the normal command for your system.

### 8. Update the bootloader

For GRUB-based distributions, update the boot menu using the distribution's normal command.

Do not remove the existing distribution kernel entry.

### 9. Reboot and select Tulip

After rebooting, select the Tulip kernel from the bootloader.

### 10. Verify

Run:

```bash
uname -a
uname -r
```

For Alpha 1, the expected internal kernel release is documented as:

```text
7.3.0-tulip2-alpha1
```

## Rollback

If Tulip fails to boot or a device does not work correctly:

1. Reboot.
2. Select your previous distribution kernel from the bootloader.
3. Boot normally.
4. Remove or repair the Tulip installation only after the working system is restored.

This is why the original distribution kernel should remain installed throughout Alpha testing.

## Secure Boot

Systems with Secure Boot enabled may reject an unsigned custom kernel or modules. Follow your distribution's normal kernel/module signing process, or test in an environment where Secure Boot policy is appropriately configured.

Do not disable security controls permanently merely to make an unverified build boot.

## DKMS and external modules

Drivers such as some NVIDIA, VirtualBox or other out-of-tree modules may need to rebuild against the Tulip kernel headers.

Check DKMS status after installation and before relying on those drivers.

## Low-memory policy

Tulip uses MGLRU as the normal memory-policy direction. Optional zram capability is intended for low-memory systems, but activation belongs to the operating system/userspace policy rather than being automatically forced by the kernel.

## Alpha warning

Tulip Alpha 1 has controlled QEMU validation and project evidence, but it is not certified on every processor, motherboard, GPU, storage controller, NIC or other device supported by upstream Linux.

For the design differences and intended advantages of Tulip, see [`docs/comparison.md`](docs/comparison.md).

For release identity and source provenance, see `UPSTREAM.md`, `SOURCE-PROVENANCE.md`, the release notes under `releases/`, and the GitHub Releases page.
