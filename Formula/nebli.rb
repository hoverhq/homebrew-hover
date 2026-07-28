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
  version "0.1.288"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "6de122753eb64124a0cde1676e49bab69ff828bfd558e07727070cc8f0936ae1"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "8a5ac73d272cb96638b2b24d5e4b1b13b5ac23490050a31656c3564890326ef2"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "a2071502222ce70a5c987d838699515a138df6ded181157d4de335290cec1e6d"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "47f769e1a1f1a4847a8a135b536a91f749ffad9981fb923fe263e8ad8a583c52"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
