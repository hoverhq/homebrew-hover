# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# hoverhq/homebrew-hover:Formula/nebli.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push. The tap repo is named
# `homebrew-hover` so `brew tap hoverhq/hover` resolves it with no explicit URL.
#
# Binaries are served from S3/CloudFront (downloads.hoverfeed.com/cli/...),
# NOT GitHub releases — the tap repo holds ONLY this formula now.
class Nebli < Formula
  desc "Drone relay CLI for Nebli"
  homepage "https://nebli.ai"
  version "0.1.283"

  on_macos do
    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "b7912a66d083d8721613093be1b00217d6b6eefa71cf148d9a9be5fcf068f426"
    end

    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "fbbab065b1e5ad96e5ee28296431d556418b12d4f181d49c39cac27b5b539095"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "51cbcba8129854f73df3cd28a0be5bba99c9b4276acbb422a67fe92ec31408f6"
    end

    on_arm do
      url "https://downloads.hoverfeed.com/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "e22ab02d4b696c2323560c104d912f4a66e3427d6326385cc5df6db7258c75e5"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
