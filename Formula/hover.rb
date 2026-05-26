# Auto-generated from deploy/distribution/homebrew/hover.rb in hoverhq/hover
# at release time. URLs point at hoverhq/releases (this repo) so the formula
# works for unauthenticated users — hoverhq/hover is currently private.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.62"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "592cf786ffa4af7882ff825fccf9df9b274f25dd1bf11cf3cb68fd756e218682"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "b07f72208e78e4be1cbb5b567bb8aa1c01146fbcccbea0adbffbc7e25e77ca6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "a976324ff08ffd509e9e733c57166f95b1dce7f613d1af26c6d03071ec77a485"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "755bcd56e48cb45ccf50ace3d9ebf2079870a686ad2c864324219052650189b7"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
