class Rune < Formula
  desc "A modern CLI text editor that bridges the gap between nano's simplicity and advanced features"
  homepage "https://github.com/exec/rune"
  version "1.2.0"
  license "MIT"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/exec/rune/releases/download/v1.2.0/rune-macos-aarch64.tar.gz"
      sha256 "dd5605b1b60f35e7b0f519663f1416f07a0522aa2e8b302aeabc431a7325ca12"
    else
      url "https://github.com/exec/rune/releases/download/v1.2.0/rune-macos-x86_64.tar.gz"
      sha256 "a16e49468a82e8d61d70c44448a1f909c87137db3fbfeda808de29b56ea9595b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/exec/rune/releases/download/v1.2.0/rune-linux-aarch64.tar.gz"
      sha256 "1db3159c1019eb89bff836f9ad3572ec9e6cbacd1a2c39e0a5b32a3619a802b5"
    else
      url "https://github.com/exec/rune/releases/download/v1.2.0/rune-linux-x86_64.tar.gz"
      sha256 "18af12776c38bd97b2e02cefc1599ea69bc83418d12c794701d24dcf6fcc9cb5"
    end
  end

  def install
    bin.install "rune"
  end

  test do
    output = shell_output("#{bin}/rune --help")
    assert_match "A modern CLI text editor", output
  end
end