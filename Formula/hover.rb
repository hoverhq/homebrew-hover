# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/releases:Formula/hover.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.67"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "ec4a997f5720182b4f0a95246f7b6264a132e32a94d035ba7d9f0e776d2771bf"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "54b422eccab2f9fb2d3561cad8905a70c562c0538297d2d2334643b4dc8bf11d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "b27e9cb9f085804569de29430791f6e9a5f8c9e2e439fbba5fde487495fafa76"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "282a16bdc49f8f413a4163a2ead1b78f2095c3b4a92057c4c92f85e8c4d70ed3"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
