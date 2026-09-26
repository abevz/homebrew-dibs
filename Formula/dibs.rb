class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.1.0-rc.1"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.1/dibs_darwin_arm64.tar.gz"
      sha256 "e62be4720ca641488cd2a97811cdebf9594fc36628b7a0e06055460496957e06"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.1/dibs_linux_arm64.tar.gz"
      sha256 "addcc862ddfd278a4444337d7bf6fcaeb1364d05e68a9492492647c63969755c"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.1/dibs_darwin_amd64.tar.gz"
      sha256 "5ede96c76d6a667a2762851c1a60fad0dfc7a254f8d7cf2d5e1e281d506bb523"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.1/dibs_linux_amd64.tar.gz"
      sha256 "508b68a3beabad58fc11c9382d3337070a0600f4a46c2b69f03ca3f12cc30c63"
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
