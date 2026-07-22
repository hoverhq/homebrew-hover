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
  version "0.1.256"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "ded72730c2407a6bc9a11b51843e3e93fe6985ebdf0e9818a5a0a939a812df9a"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "305979768c98b3e515191887715a9c6a7061fd4b96388338727123e4896ac4cf"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "0bb8b9bdcc115020310c467708cf795aab7807e039ce8e2de89a9eb091e92f23"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "0704ec27c1573ecddbee2ddeda55abf61bb9281931f21e7e443ce7638b5a2eb9"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
