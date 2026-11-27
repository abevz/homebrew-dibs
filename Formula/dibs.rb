class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.3.1"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.3.1/dibs_darwin_arm64.tar.gz"
      sha256 "8df852933fef442da14a81d94775c72f098a6051702e93582ac956dd8862a293"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.3.1/dibs_linux_arm64.tar.gz"
      sha256 "ef92d6d156cbe84541b6de9ad46f68c1c93ba6d2745685fbe8c84871a11d9ad7"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.3.1/dibs_darwin_amd64.tar.gz"
      sha256 "d376f80eb91a0ac05edd531aa972c384a1ebf531bc0dc2269aae380a587b5f2c"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.3.1/dibs_linux_amd64.tar.gz"
      sha256 "f8df6a1d4ea997020707f12b05a6e0de46b5e8237a7ab2e3ddd041e359b3a6e1"
    end
  end

  def install
    bin.install "dibs", "dibsd", "dibs-mcp"
    pkgshare.install "LICENSE"
  end

  test do
    system "#{bin}/dibs", "version"
  end
end
