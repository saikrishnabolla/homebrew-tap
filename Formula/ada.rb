class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-arm64.tar.gz"
      sha256 "b21d7d72bf51931011dac6227acf792983267c6b3378aba25e0b6ee665450a8d"
    end
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-x64.tar.gz"
      sha256 "0618dfef5601643b06aaeda23acb91a41976aa6a7cb767ccfa74551f9f82f2e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-linux-x64.tar.gz"
      sha256 "1ce3f9dafab7843b9ed36248e4084e7cb3ee2606bc4fb6d71a0ff8b9ce32ec5f"
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
