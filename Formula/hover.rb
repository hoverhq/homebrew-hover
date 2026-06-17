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
  version "0.1.157"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "af00bbc58ad89e96ff7788cc3efa50b93693d9d104859fdbb32c6d1fd9b1771d"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "417e79240510388a81515c73d951b822015b7697a24862eff6c0a148f5f92e8b"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "4d2230b87cd762b542add25d9693fe8a488ccaea6f84506eae17f431481d5797"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "256152f7131efd7cf9effb33125de608194e950f1f8484b322239c9bcbecd897"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
