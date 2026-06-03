# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/releases:Formula/hover.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.84"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "cf4568e1d669c60bc5d349dd8f8d5876612c0217d029c781d1b12da75c86ba47"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "89e79e378afe2843d6a4df995bcc6c8c15a5e232dff1e16aefcc611a6b63beac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "ce8f0f4f13aea24f88e97cf3fd0b864af0e59f01e3d70b30c0301d5e4ee660df"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "e48c9d38563b672fe18592a42743ea3b17e3f13ff14b0abee6697d20d4d27de4"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
