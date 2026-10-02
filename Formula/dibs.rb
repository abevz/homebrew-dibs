class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.1.0-rc.5"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.5/dibs_darwin_arm64.tar.gz"
      sha256 "3237c932641e8d425fa700e46629fb50a79987589b33a84f48adebb23c20c8bf"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.5/dibs_linux_arm64.tar.gz"
      sha256 "f231d70e5513a61d9decab9bdb9b641815a38634be415c0a39e3b5384019a4bb"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.5/dibs_darwin_amd64.tar.gz"
      sha256 "b9450408f933117163f4ed56237ce1f7853df5482bbc11e0c28944bc47fa721a"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.5/dibs_linux_amd64.tar.gz"
      sha256 "1b7ef3bba8aa573bc402f8f14447652eb191ed7b02cf595e739c896095a7e273"
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
