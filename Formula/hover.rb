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
  version "0.1.152"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "155e1dc2334a8f2021fda1e9f49dca784a1dcbad1f9e709291583faa6688441e"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "4becf48ced045b5e888c9a0d357f5a5663c8e7501065f593327afbe83342daf3"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "64f65d3307bac6dff967a5745e414aa547b8f1ab9fb86247fd181fff7c7d8487"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "a766c1e6662507b46d749bcb38b314e4aa4c0baadb2e6ffa22e702f467475b5d"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
