class Auths < Formula
  desc "Cryptographic identity for developers — sign artifacts, replace API keys"
  homepage "https://auths.dev"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-macos-aarch64.tar.gz"
      sha256 "faf7b92193f0fde23b0281700c919b02154ed3608c0e8c8470c6ae735ba49014"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-linux-x86_64.tar.gz"
      sha256 "38c63fa38aad94110a33e62e8e096fe2eef5e45b96bece277e65c8c6bb558c77"
    end
    on_arm do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-linux-aarch64.tar.gz"
      sha256 "c60ee92d903635fc38bb1be834631af80b5566dc8dbf4611b7475f963a8721ae"
    end
  end

  def install
    bin.install "auths"
    bin.install "auths-sign" if File.exist?("auths-sign")
    bin.install "auths-verify" if File.exist?("auths-verify")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/auths --version")
  end
end
