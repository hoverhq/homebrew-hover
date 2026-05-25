# Auto-generated from deploy/distribution/homebrew/hover.rb in hoverhq/hover
# at release time. URLs point at hoverhq/releases (this repo) so the formula
# works for unauthenticated users — hoverhq/hover is currently private.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.57"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "c1112dbe3822a7d848f09eeed04ad9983a92ef5d63f3cc1bfeb6a2f5a7e47113"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "72fec865dbf8e1b33a619c026b5ec90c657f8fe9549f81fe1c8d884cf3c86ed9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "8a5de1aa377a233845e6ca0dfcd2750ffaf17bfeda8d9ab2a30bae4c3e626733"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "1b7807b17dbcf9498abe7a46e05112fdb6e2e2c46312bce60f22749104152e1c"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
