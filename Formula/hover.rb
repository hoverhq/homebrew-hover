# Auto-generated from deploy/distribution/homebrew/hover.rb in hoverhq/hover
# at release time. URLs point at hoverhq/releases (this repo) so the formula
# works for unauthenticated users — hoverhq/hover is currently private.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.54"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "43a3b55645c59cd6dbd364c56d7d3adb96466721060acd65ab42a2580064b1a9"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "37bfbf1b63430b0fbe0ddf13d66e2048ba57a39390666467a2b69ec309b1fc79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "827a7e6d1f85eee79da0215bb102ba3b6149042473ee549edd75b58276d43c3d"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "470d34681fa99fe4504f190f23449b433846c658bfaf30275c6af46c02498aa1"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
