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
  version "0.1.141"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "ccfdaabffef90e71a7ef329ed7489fedf452c2114132e4c2f5ae1c2e8f6ecb59"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "1f89c16d6c7a40e2e714247fa4b6fb317122c6c7d9135da78c0c968da8389d7b"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "027f5f36ee3dca6d50462a4a40e663e5b6c86d73479d139d95348dead4a7a9d9"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "545b09ded3ac563c5793e3f38c619dad78f0dd1d1f1645bd7e75feba8ced5d9c"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
