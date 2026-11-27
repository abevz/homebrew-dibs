class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.3.0"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.3.0/dibs_darwin_arm64.tar.gz"
      sha256 "836d59ace5ca036c651dbeca6f8cca2221da666d380b902a02faa4b34026b538"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.3.0/dibs_linux_arm64.tar.gz"
      sha256 "dd61d3bae91c96f2331dbbade8c2950fbf15dbdd2d416b822e35a5ec99d81cc2"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.3.0/dibs_darwin_amd64.tar.gz"
      sha256 "fa8bd5293e08a422fbfc27df7bbc84fa5ad75b22ac33d533e58c59714b932105"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.3.0/dibs_linux_amd64.tar.gz"
      sha256 "a633a6c5d2af49b16da66469b6beb305a09a9e4675f801504f7ff1d8442b773e"
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
