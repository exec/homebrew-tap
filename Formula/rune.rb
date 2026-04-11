class Rune < Formula
  desc "A modern CLI text editor that bridges the gap between nano's simplicity and advanced features"
  homepage "https://github.com/exec/rune"
  license "MIT"

  # Dynamic version detection
  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  version do
    spec = self.class
    # Fetch the latest tag from the API
    json = Utils::JSON.parse(Utils::GitHub.open_api("https://api.github.com/repos/exec/rune/releases/latest"))
    json["tag_name"].gsub(/^v/, "")
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/exec/rune/releases/download/v1.4.1/rune-macos-aarch64.tar.gz"
    else
      url "https://github.com/exec/rune/releases/download/v#{version}/rune-macos-x86_64.tar.gz"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/exec/rune/releases/download/v#{version}/rune-linux-aarch64.tar.gz"
    else
      url "https://github.com/exec/rune/releases/download/v#{version}/rune-linux-x86_64.tar.gz"
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