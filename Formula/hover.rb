# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/releases:Formula/hover.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push.
class Hover < Formula
  desc "Drone relay CLI for Hover"
  homepage "https://hoverfeed.com"
  version "0.1.77"

  on_macos do
    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-arm64.tar.gz"
      sha256 "abd48b6ae202a47b9c754b18d343a9f7dab55d805919fb89688d1dea82e9ff13"
    end

    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-darwin-amd64.tar.gz"
      sha256 "e3787edb2a1bdd534d295117b691b2482497d3364d5853a515ec29f7ab9bb457"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-amd64.tar.gz"
      sha256 "83f6fbe5144e66709a634293b408a42eb7281eab4dc83059adaba66ce07ebfb3"
    end

    on_arm do
      url "https://github.com/hoverhq/releases/releases/download/v#{version}/hover-linux-arm64.tar.gz"
      sha256 "921211bac79ea6b04af2ad82436d2b0f5ad95730f9ca425585e3406ce79b91ed"
    end
  end

  def install
    bin.install "hover"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hover --version")
  end
end
