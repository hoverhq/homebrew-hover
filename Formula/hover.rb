# Auto-generated from deploy/distribution/homebrew/hover.rb in hoverhq/hover
# at release time. URLs point at hoverhq/releases (this repo) so the formula
# works for unauthenticated users — hoverhq/hover is currently private.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.60"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "8634acbb0509c1567ec2348ab01e14a027385fc0e6ec2d8236d9370999f4d298"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "28cb6cdc3aeede97fea8312bfad81d1f291b9721ecb1253dca9da1f15cc66262"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "c0a0cf681059b4eb6e9c2694857c2bd10e24389922e7af833d45fd6764c6d452"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "28e06761dcefad52784d82cfe992fd7ae9eee7dfd9f43e0b903a6b919b42e123"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
