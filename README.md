# hoverhq/releases

Distribution artifacts for the Hover CLI — Homebrew formula, install-script mirrors, and (in time) Scoop manifest, Debian/RPM repositories, and Windows MSI packages.

The release binaries themselves live on the source repo's release page: <https://github.com/hoverhq/hover/releases>. This repo carries only the package-manager-facing metadata that points at them.

## Install

### Homebrew (macOS, Linux)

```bash
brew install --formula https://raw.githubusercontent.com/hoverhq/releases/main/Formula/hover.rb
```

Or with a tap (once we register one):

```bash
brew tap hoverhq/releases
brew install hover
```

### Direct download

Binaries (5 platforms: linux amd64+arm64, macOS amd64+arm64, Windows amd64) are published on each release of `hoverhq/hover`. Verify with `SHA256SUMS`:

```bash
curl -fsSL https://github.com/hoverhq/hover/releases/download/hover-v0.1.0/SHA256SUMS -o SHA256SUMS
curl -fsSLO https://github.com/hoverhq/hover/releases/download/hover-v0.1.0/hover-darwin-arm64.tar.gz
shasum -a 256 -c <(grep darwin-arm64 SHA256SUMS)
tar -xzf hover-darwin-arm64.tar.gz
./hover --version
```

### Install script

```bash
curl -fsSL https://raw.githubusercontent.com/hoverhq/hover/main/scripts/install-hover.sh | bash
```

The script resolves the latest release, downloads the right asset for your platform, verifies the checksum, and installs to `/usr/local/bin/hover` (root) or `~/.local/bin/hover` (user).

## Layout

```
Formula/
  hover.rb         # Homebrew formula
```

## Updating the formula

`Formula/hover.rb` is regenerated from `deploy/distribution/homebrew/hover.rb` in `hoverhq/hover` after each release. To bump:

1. Tag `hover-vX.Y.Z` on `hoverhq/hover` — the release workflow builds the binaries and publishes the GitHub release.
2. Pull `SHA256SUMS` from the new release.
3. Substitute version + per-platform SHAs into the template.
4. Push to this repo.

A small helper script in `hoverhq/hover` will eventually do steps 2–4 automatically.
