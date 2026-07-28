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
  version "0.1.284"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "2e3c4146acdb7d894814a98ffd51ab93c2b037fa69dab668c06ddddfe8c3037a"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "bd3cd88fd78a1e73bd6cd0e984c4ce07878eac3a3a6d77908bebe60eac3e5be7"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "e0867ad5698112d3a20d74233d3c7084457654c2654bc4215ac2097a31fee032"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "51cedb0dc1c9496774b20023fb583a41a4e8745238f30abb5b7f0cbdb6d83fb8"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
