class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.1.0-rc.3"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.3/dibs_darwin_arm64.tar.gz"
      sha256 "376df549e63e5d9578ab811e3e1e806e4f214fa072aa29a265db1f424f81e224"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.3/dibs_linux_arm64.tar.gz"
      sha256 "39d17a5342cde9a56ec835fbde3a9a6c58d1fb6ef25f30590bdb57391ee75b36"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.3/dibs_darwin_amd64.tar.gz"
      sha256 "b4387fd35e1ee92dac7ff9f2f67cb0abe72ebb8758ce55cf0d87403442105e56"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.3/dibs_linux_amd64.tar.gz"
      sha256 "bf6110f94092cc9ff3b0e790e44e9e2e53765112bd33a63a16c3b73abe252de0"
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
