# Auto-generated from deploy/distribution/homebrew/hover.rb in hoverhq/hover
# at release time. URLs point at hoverhq/releases (this repo) so the formula
# works for unauthenticated users — hoverhq/hover is currently private.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "dddbf79e4b384607fdddccf09f07d45f2f28cc1ca2bef47806ce796a9f01eccb"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "73f4b78e5e98953c6ceb40f1e1abf15f89f894971aca2abb3b8c9b8a2c0c8d27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "9764c3f78840bf7f74a06a7d6aed7de814d27d9c34eb7224f4528fcea5b4e379"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "9dcb4fd0cc0b9276a9f75d1247e9eebb00d3a6925fc7a7720b0fb7c3018836a8"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
