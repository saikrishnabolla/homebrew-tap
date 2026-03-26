class Ada < Formula
  desc "The AI research agent for the terminal"
  homepage "https://thinkwithada.com"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/saikrishnabolla/homebrew-tap/releases/download/v0.1.0/ada-0.1.0-darwin-arm64.tar.gz"
      sha256 "2db80cef3694f69e15804ad4657c1c91c28f8467c804bb441aca6ef6234b655c"
    end
  end

  def install
    # The native bundle includes Node.js — no external dependency needed
    libexec.install Dir["*"]

    # Symlink the launcher
    bin.install_symlink libexec/"ada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ada --version")
  end
end
