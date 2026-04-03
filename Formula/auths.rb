class Auths < Formula
  desc "Cryptographic identity for developers — sign artifacts, replace API keys"
  homepage "https://auths.dev"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-macos-aarch64.tar.gz"
      sha256 "62771647d2444875c9dfebec17873c37684d723ad07b5abbb5598bf633aac46d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-linux-x86_64.tar.gz"
      sha256 "cb9fa036ff3d651f74ea6636480d36ae3ac24798859d262a56602f029e6b54e3"
    end
    on_arm do
      url "https://github.com/auths-dev/auths/releases/download/v#{version}/auths-linux-aarch64.tar.gz"
      sha256 "d29c78293709de000d687a0c77000120d2167e41aa8c9c04df80a062fae20166"
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
