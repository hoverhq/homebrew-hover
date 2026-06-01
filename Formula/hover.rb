# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/releases:Formula/hover.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.68"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "1ccf94de7f0dbf703c2eca8f179f21e147e69938caf22afda7e05ffabe3b7b9a"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "07fa543816813533cc19b96379ffb50421ff89632181ad69609ac9758e07ea5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "6a3897ca05455556afaef3ef7166efc6f0f617125b69b44a645fcfa12fb96bdf"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "2def1133c9af2393f70e4eced46de1051ef61c0ed4a2646ed8541d4496c64337"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
