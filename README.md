# hoverhq/releases

Distribution artifacts for the Hover CLI — Homebrew formula, mirrored binaries, and (in time) Scoop manifest, Debian/RPM repositories, and Windows MSI packages.

This repo is the **public-facing** distribution surface. The source repo (`hoverhq/hover`) is private; assets land here so unauthenticated downloads — Homebrew, install scripts, browsers — Just Work.

## Install

### Homebrew (macOS, Linux)

```bash
brew tap hoverhq/hover https://github.com/hoverhq/releases.git
brew install hoverhq/hover/hover
```

The tap URL is decoupled from the tap name on purpose — the tap is **named** `hoverhq/hover` (the package's natural namespace) but lives at `github.com/hoverhq/releases` (where the artifacts are mirrored).

Verify:

```bash
hover --version
# hover 0.1.0 (built 2026-05-16T23:03:21Z, commit dbf1a78)
```

### Direct download

Binaries for all five platforms are attached to each release:

```bash
TAG=v0.1.0
PLATFORM=darwin-arm64     # or darwin-amd64, linux-amd64, linux-arm64
curl -fsSLO https://github.com/hoverhq/releases/releases/download/${TAG}/SHA256SUMS
curl -fsSLO https://github.com/hoverhq/releases/releases/download/${TAG}/hover-${PLATFORM}.tar.gz
shasum -a 256 -c <(grep ${PLATFORM} SHA256SUMS)
tar -xzf hover-${PLATFORM}.tar.gz
./hover --version
```

### Install script

The source repo ships an install script. It resolves the latest release, downloads the right asset, verifies the checksum, and installs:

```bash
curl -fsSL https://raw.githubusercontent.com/hoverhq/hover/main/scripts/install-hover.sh | bash
```

(Note: `install-hover.sh` currently reads from `hoverhq/hover` — works for engineers with repo access; the public mirror path is a planned follow-up.)

## Releases

| Version | Date       | Source tag                                              |
|---------|------------|---------------------------------------------------------|
| v0.1.0  | 2026-05-16 | [`hover-v0.1.0`](https://github.com/hoverhq/hover/releases/tag/hover-v0.1.0) |

## Layout

```
Formula/
  hover.rb         # Homebrew formula
```

## Updating

After a new tag pushes on `hoverhq/hover` and the release workflow completes:

1. Download SHA256SUMS from the new `hoverhq/hover` release.
2. Mirror tarballs + SHA256SUMS to a same-versioned release on this repo.
3. Substitute version + per-platform SHAs into the template (`hoverhq/hover/deploy/distribution/homebrew/hover.rb`) and overwrite `Formula/hover.rb`.
4. Push.

A small helper in `hoverhq/hover` will eventually automate steps 1–4.
