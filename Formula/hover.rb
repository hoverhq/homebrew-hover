# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/homebrew-hover:Formula/hover.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push. The tap repo is named
# `homebrew-hover` so `brew tap hoverhq/hover` resolves it with no explicit URL.
#
# Binaries are served from S3/CloudFront (downloads.hoverfeed.com/cli/...),
# NOT GitHub releases — the tap repo holds ONLY this formula now.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.241"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "2a96b4993a73f885ddff0a736d727de87b18b47d98b34a57c6aacda76e3bd1be"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "6b9660b900062d21c260505767cc09201b23eacd3e6f190e9d3d2bc1c7a371ad"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "58337ff76655740ec454eed9277f4e40667b1cebf5cfc740ed2ddf4b3930dde8"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "509ec89ecb8c61c01a6aced3b2eb526cc4ecae3323a64677d7841a4ecd24987a"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
