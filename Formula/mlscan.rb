class Mlscan < Formula
  desc "Machine learning-enhanced port scanner with adaptive performance"
  homepage "https://github.com/exec/mlscan-rs"
  version "0.2.2"
  license "MIT"
  head "https://github.com/exec/mlscan-rs.git", branch: "main"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/exec/mlscan-rs/releases/download/v0.2.2/mlscan-macos-aarch64.tar.gz"
      sha256 "4e0de5d468a27db066d38a55e95415a0df05080840876fadf45d2887f349f381"
    else
      url "https://github.com/exec/mlscan-rs/releases/download/v0.2.2/mlscan-macos-x86_64.tar.gz"
      sha256 "b1d48bdf2b339497b446bfa806bbb836c4cec4547f17e2599e29996f0c7c49e2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/exec/mlscan-rs/releases/download/v0.2.2/mlscan-linux-aarch64.tar.gz"
      sha256 "66e123eef600a596acce4ca47a17c25c201b8796429abce4cca05454b5cd63f1"
    else
      url "https://github.com/exec/mlscan-rs/releases/download/v0.2.2/mlscan-linux-x86_64.tar.gz"
      sha256 "6e679ddbd81128795b9ff557d5232daeaf67b762c0d849a86180e85ad852d880"
    end
  end

  def install
    bin.install "mlscan"
  end

  test do
    system "#{bin}/mlscan", "--version"
    system "#{bin}/mlscan", "--help"
  end
end