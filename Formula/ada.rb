class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-arm64.tar.gz"
      sha256 "60a012dc220e825802ac8e73265fa00ded73e3e643de5d2d218c8aa578d0ce6e"
    end
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-x64.tar.gz"
      sha256 "bce3fc435fae0f9c34e79e9bb03c2df452bee45a949cb21e0ec462bd47ae775e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-linux-x64.tar.gz"
      sha256 "3898ab8e75c13a167badb89d77071c359aec6a4296daa3464e8a6fe21acaa958"
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
