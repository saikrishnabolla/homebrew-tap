class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-arm64.tar.gz"
      sha256 "eab45e84155ee8f39fc1c076a4551d3965f409fb51d1727f1200e94eb692c47b"
    end
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-darwin-x64.tar.gz"
      sha256 "f7940eb48c222aa1404bcf0d3addd64fee6fb37a8e9b80e9ddf8e7ed4ec1fe85"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.2/ada-0.1.2-linux-x64.tar.gz"
      sha256 "02c2b067e3e3af8c368bcf1f074c519e2aee31d404c386fe6511dc3779517381"
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
