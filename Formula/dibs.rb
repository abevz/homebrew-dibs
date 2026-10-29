class Dibs < Formula
  desc "Local execution ledger for AI agents"
  homepage "https://github.com/abevz/dibs"
  version "0.1.0-rc.6"
  license "Apache-2.0"

  on_arm do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.6/dibs_darwin_arm64.tar.gz"
      sha256 "e3df87dca7e389d30877dbbc21f48ea106fa6563cfe25f00f0b795cdc75dc006"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.6/dibs_linux_arm64.tar.gz"
      sha256 "76833d911ed222cc4f845bf830366948b79a2829326e166c170eda39703dda6e"
    end
  end

  on_intel do
    on_macos do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.6/dibs_darwin_amd64.tar.gz"
      sha256 "33290c75955ae0851f8dcdaf6c1eeba78debdf49fc6a7e7b03bb4d61c9f74891"
    end
    on_linux do
      url "https://github.com/abevz/dibs/releases/download/v0.1.0-rc.6/dibs_linux_amd64.tar.gz"
      sha256 "0ea505e0a588a52977257d4d0290ca4206e47adc597600306ca230770421fc3c"
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
