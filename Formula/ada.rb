class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  url "https://github.com/saikrishnabolla/ada/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "Apache-2.0"

  depends_on "node@20"

  def install
    system "npm", "install", "--ignore-scripts", "--no-audit", "--no-fund"
    system "npm", "run", "build"

    # Install everything to libexec
    libexec.install Dir["*"]
    libexec.install ".ada"

    # Re-run npm install in libexec to get node_modules in the right place
    cd libexec do
      system "npm", "install", "--ignore-scripts", "--no-audit", "--no-fund", "--production"
    end

    # Create wrapper script that calls the real binary
    (bin/"ada").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node@20"].opt_bin}/node" "#{libexec}/bin/ada.js" "$@"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ada --version")
  end
end
