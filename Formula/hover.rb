# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/homebrew-hover:Formula/hover.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push. The tap repo is named
# `homebrew-hover` so `brew tap hoverhq/hover` resolves it with no explicit URL.
#
# Binaries are served from S3/CloudFront (downloads.nebli.ai/cli/...),
# NOT GitHub releases — the tap repo holds ONLY this formula now.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://nebli.ai"
  version "0.1.255"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "46f6e474082737c0a87f898e3983a8ef67ca0a0ec852ca0f7b8c7d388551bf8e"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "a81da0e87709f4955819919fb9fcb46b013bb68f507ce72d82474f96f6ec2020"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "56799fe5a30cec5b4223c7efb555021bed41d3f310ba5206de85208eebf93a94"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "c55bd6ed1a8e348ff7c05675eb9759b5af4bd3c8bdeaf0ea59a9e8eee52632b6"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
