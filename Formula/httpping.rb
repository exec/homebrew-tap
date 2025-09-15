class Httpping < Formula
  desc "Advanced HTTP monitoring and ping utility for modern infrastructure"
  homepage "https://github.com/exec/httpping"
  url "https://github.com/exec/httpping/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f54d2e3427c65e3a7d288c8de79c4dc60f7ca7d7d1896e18d9c4008592cd087a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    # Test that the binary exists and shows help
    assert_match "Advanced HTTP monitoring and ping utility", shell_output("#{bin}/httpping --help")
    
    # Test that we can generate a config
    system bin/"httpping", "init", "--output", "test-config.yml"
    assert_predicate testpath/"test-config.yml", :exist?
    
    # Test basic ping functionality with a timeout
    system bin/"httpping", "https://httpbin.org/get", "-c", "1", "-t", "5"
  end
end