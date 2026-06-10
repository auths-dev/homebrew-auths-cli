class Auths < Formula
  desc "Cryptographic identity for developers — sign artifacts, replace API keys"
  homepage "https://auths.dev"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-macos-aarch64.tar.gz"
      sha256 "33ab5bd7dc8dd2ceddd47b953f593e4e7a6a19a7c942842d4cdb34fc874733f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-linux-x86_64.tar.gz"
      sha256 "aec691b2ca04d1a14b24660bf60aa203a2e650d03746f770b93052c1a85bb9db"
    end
    on_arm do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-linux-aarch64.tar.gz"
      sha256 "b0b02f2e88ad7f403f9d2fbd021abbdb74a195dd5fcf159e4ba7c126ae9660e7"
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
