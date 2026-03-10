class Alcapwn < Formula
  desc "Reverse shell operator console and C2 framework"
  homepage "https://github.com/exec/alcapwn"
  license "MIT"

  # Dynamic version detection
  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  version do
    spec = self.class
    # Fetch the latest tag from the API
    json = Utils::JSON.parse(Utils::GitHub.open_api("https://api.github.com/repos/exec/alcapwn/releases/latest"))
    json["tag_name"].gsub(/^v/, "")
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/exec/alcapwn/releases/download/v#{version}/alcapwn-macos-aarch64.tar.gz"
    else
      url "https://github.com/exec/alcapwn/releases/download/v#{version}/alcapwn-macos-x86_64.tar.gz"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/exec/alcapwn/releases/download/v#{version}/alcapwn-linux-arm64.tar.gz"
    else
      url "https://github.com/exec/alcapwn/releases/download/v#{version}/alcapwn-linux-amd64.tar.gz"
    end
  end

  def install
    bin.install "alcapwn"
  end

  test do
    output = shell_output("#{bin}/alcapwn --help 2>&1", 1)
    assert_match "alcapwn", output
  end
end
