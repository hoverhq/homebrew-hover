# Auto-generated from deploy/distribution/homebrew/hover.rb in hoverhq/hover
# at release time. Do not edit by hand — re-run the release pipeline
# instead (see hoverhq/hover/.github/workflows/hover-release.yml).
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/hover/releases/download/hover-v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "079edd3be0909bb41dbda982ec4e70f48cf46b5153cf115448a3d645111faf10"
    end

    on_intel do
      url "https://github.com/hoverhq/hover/releases/download/hover-v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "c2bb59299398cdcfefd2ba9a6c9c0cee24f79c1232197674e7d397d01dcc91e4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/hover/releases/download/hover-v#{version}/hover-linux-amd64.tar.gz"
      sha256 "683fa0c2b265c7edd64f023f68dc166e365d90dda999340421e4f7c36a74afa8"
    end

    on_arm do
      url "https://github.com/hoverhq/hover/releases/download/hover-v#{version}/hover-linux-arm64.tar.gz"
      sha256 "0a1c1a70a9e2ac51352667b536a9fbe1ee329830b015241d73b2d24f7de199d2"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
