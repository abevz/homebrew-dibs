class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.2.0"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.2.0/dibs_darwin_arm64.tar.gz"
      sha256 "684e44ed5f806ed8403992f8eb7d7cd6ac46a6735e1c18d3744553bece9c4b21"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.2.0/dibs_linux_arm64.tar.gz"
      sha256 "99ce03f9387158582710527deef0e1fae8aeda978ab2abee4321efd1eea3fa72"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.2.0/dibs_darwin_amd64.tar.gz"
      sha256 "a67c2417807b89a05e444d96292cb32676158b61f08f893be37b65da2ae92b46"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.2.0/dibs_linux_amd64.tar.gz"
      sha256 "c148fa5eefabac59b453fc3c391da36165f5cfa13b0db0c2882722fc58d1b0f9"
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
