class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-arm64.tar.gz"
      sha256 "fbc6ba4f8f61a607f8e08dabde7f66d3282d882eda75f49555f14583329d9695"
    end
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-x64.tar.gz"
      sha256 "5bf82b5d6ce4c7fb3a2d0f017213d6442a72e76881c209a652a8c976b8d33616"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-linux-x64.tar.gz"
      sha256 "5409c97c03a3edb75461d76e8c1a3b6d7d8504ee713c3f33bef9da521a93c10f"
    end
  end

  def install
    libexec.install Dir["*"]

    (bin/"ada").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/node/bin/node" "#{libexec}/app/bin/ada.js" "$@"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ada --version")
  end
end
