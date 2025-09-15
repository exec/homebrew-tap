class Portscope < Formula
  desc "Advanced network port scanner with intelligent service detection"
  homepage "https://github.com/exec/portscope"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/exec/portscope/releases/download/v0.1.0/portscope-macos-aarch64.tar.gz"
      sha256 "04070d009313f215611c5d3301d741ad2287195866d876caa525c4b148ab7603"
    else
      url "https://github.com/exec/portscope/releases/download/v0.1.0/portscope-macos-x86_64.tar.gz"
      sha256 "4a49fb540848049df8657d7f9d2c63cfa9c7eccba9f06a5c07d9a9f25ac2538e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/exec/portscope/releases/download/v0.1.0/portscope-linux-aarch64.tar.gz"
      sha256 "96a278eab144743113129065d7bd85c5c3de468a25b19c01116473dd4870d823"
    else
      url "https://github.com/exec/portscope/releases/download/v0.1.0/portscope-linux-x86_64.tar.gz"
      sha256 "ede8110bb330259187d5fff71a9c31745f135c9dbe1d6d39d9be24e93eb75d1b"
    end
  end

  def install
    bin.install "portscope"
  end

  test do
    assert_match "portscope #{version}", shell_output("#{bin}/portscope --version")
    # Test help output
    assert_match "Advanced network port scanner", shell_output("#{bin}/portscope --help")
  end
end