class Alcapwn < Formula
  desc "Reverse shell operator console and C2 framework"
  homepage "https://github.com/exec/alcapwn"
  license "MIT"

  version "2.0.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/exec/alcapwn/releases/download/v2.0.0/alcapwn_darwin_arm64"
    else
      url "https://github.com/exec/alcapwn/releases/download/v2.0.0/alcapwn_darwin_amd64"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/exec/alcapwn/releases/download/v2.0.0/alcapwn_linux_arm64"
    else
      url "https://github.com/exec/alcapwn/releases/download/v2.0.0/alcapwn_linux_amd64"
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