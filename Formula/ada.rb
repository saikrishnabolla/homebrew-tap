class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.1/ada-0.1.1-darwin-arm64.tar.gz"
      sha256 "96b2300da6378d42d87655a32c8e22320c5d1ecfe0c23a1443252d846bd1e7fb"
    end
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.1/ada-0.1.1-darwin-x64.tar.gz"
      sha256 "161eeb46cb72b37d3b936c02d7446024e32eaf5f3ec099818428d4c95d9480a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.1/ada-0.1.1-linux-x64.tar.gz"
      sha256 "f1543d56dc208d5468a95866990e696bfb05bc2d014dd02742c922ecbd1494fc"
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
