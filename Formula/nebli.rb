# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/homebrew-hover:Formula/nebli.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push. The tap repo is named
# `homebrew-hover` so `brew tap hoverhq/hover` resolves it with no explicit URL.
#
# Binaries are served from S3/CloudFront (downloads.hoverfeed.com/cli/...),
# NOT GitHub releases — the tap repo holds ONLY this formula now.
class Nebli < Formula
  desc "Drone relay CLI for Nebli"
  homepage "https://nebli.ai"
  version "0.1.285"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "1f47464ab189a7b53d1c9df61f6222a173965e7289a1bbc9eb99f80d950eb568"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "7c4355b8e4d0c3013090f9e3bb2cda5c9d9ecf9624ee75455a0dc072a338d838"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "bf223592106a4236d2a8b424442d131e2dec57fd8e045fedc00369eec2065fe6"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "220da7d06dcfae3bdd9b534065a163066c5a4126a3a4de78f02e7a3a60a53839"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
