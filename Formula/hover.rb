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
  version "0.1.235"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "fc0b625bb60ff136643cde90946d26254230d19d3af652ef5cb1da31a01c1c15"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "f78875e31d0a98c323fa5bad57c6401f5baacab5e0d89a3fa9cc7c638c591c82"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "abd064584f834c683dba7726e34299c8b0e1684c428111a0fc357fb33aaadfcc"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "f1018d739b119d498c2d13202ba955dedc69e4f3926532c0167566168e3f4c71"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
