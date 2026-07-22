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
  version "0.1.254"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "869f1cc091d0a2d63f36a5368da03767f7204dcba9d14f65d7bf62df1f7e6e1d"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "8eda0680da963588189c4d8b23603a4b5b0f83746cea79afaae6f5042dca5ac7"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "fd322f340e711f8663f905e7d43595c1a476ed797bd91c080ce20a09d2f8941d"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "30275f010a383db1bcc01d42525aaffd36bbf3b7643574f57fece856506d7ed7"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
