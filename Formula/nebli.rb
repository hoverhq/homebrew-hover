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
      sha256 "63286da57681ab8afa0c2bba20dc3335bd21a8d5ab3c262b2c9375458a82019a"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "d4dcc3eed5417118bf373f8e83fc2358bf9b07344b8477bfdc5926ad6a367091"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "574a7910a81b56002b8e963768087745e9bf37c0b5a12a1cd357844b3b1128c3"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "318a46adb7958b2ce3bdae80440d574001098dd461bf3f9b15660f6a0ffe14aa"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
