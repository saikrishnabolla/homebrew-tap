class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-arm64.tar.gz"
      sha256 "3bc0b95dbdc2366e8bafd4a649eb409f9d73732b7bc07c36f8078e6ab26bfa27"
    end
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-x64.tar.gz"
      sha256 "54076672f3c656761c7f61bc1bdd20bd017070e6d0fa661b454f4665acb0109c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-linux-x64.tar.gz"
      sha256 "004e15033bc762f85d780f971a83a73d0c4ffd43fd1b9f4689e89431ab0a1956"
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
