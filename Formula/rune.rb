class Rune < Formula
  desc "A modern CLI text editor that bridges the gap between nano's simplicity and advanced features"
  homepage "https://github.com/exec/rune"
  version "1.5.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/exec/rune/releases/download/v1.5.2/rune-macos-aarch64.tar.gz"
      sha256 "3d47bbc1cb04e30715aff09fe9d271ecec5cd6ba891719f618415abd0562993e"
    else
      url "https://github.com/exec/rune/releases/download/v1.4.1/rune-macos-x86_64.tar.gz"
      sha256 "d13fd082eb201941c5826c420c76e61345bc11dcca2fec2b3baad5ad0e56dace"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/exec/rune/releases/download/v1.4.1/rune-linux-aarch64.tar.gz"
      sha256 "05f8392d7e19fc3a85cbb745be6d3e5f60960539d027aaea312e9142199c955f"
    else
      url "https://github.com/exec/rune/releases/download/v1.4.1/rune-linux-x86_64.tar.gz"
      sha256 "24f08f4e2ea88d32ddf5c99d5a03cddd89fc918512fa6133508bbb45ecf67796"
    end
  end

  def install
    bin.install "rune"
  end

  test do
    output = shell_output("#{bin}/rune --version")
    assert_match "rune", output
  end
end
