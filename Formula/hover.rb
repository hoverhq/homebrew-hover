# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/releases:Formula/hover.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.83"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "34699f0bc8ae33619e5e02c2631cab8a10695df600e3aa6becad788158b371d3"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "fd61896c9ce608892b95fafbd0bb03739c344a849085c9bb4d94b1ce5f827f94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "41d0f3b2d16e5c4a4e795325612eaab559224483baf7e1b993401a39c78b1cdd"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "42291cc9bcf778261d27adad0e63ee2e0c08b97fb0f78e03b48c6acebdad8b80"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
