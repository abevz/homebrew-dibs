class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.1.0-rc.4"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.4/dibs_darwin_arm64.tar.gz"
      sha256 "f13cad0ca206edba19795315e011e8cc0f6effb99126911c3e15632532177e39"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.4/dibs_linux_arm64.tar.gz"
      sha256 "8ca7bc6558db25db67c2192713aec020e35a2145470edb25fa474c3b2b8e5088"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.4/dibs_darwin_amd64.tar.gz"
      sha256 "379639f3d47f430ffc192353c28bbfff00f32d510c7c7334705975fd839ee01a"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.4/dibs_linux_amd64.tar.gz"
      sha256 "43c4b3f261562e4c4a623450a55ce01f4fdeeda6cb823fc4731a9720a6148ff6"
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
