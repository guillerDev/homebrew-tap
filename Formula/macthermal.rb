class Macthermal < Formula
  desc "macOS temperature & fan-speed analyzer (reads the SMC via IOKit)"
  homepage "https://github.com/guillerDev/macthermal"
  url "https://github.com/guillerDev/macthermal/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "214df6882bb1497e6a69b2e1799e982925105a49eac9c025c5bd32a9c1fbfdc1"
  license "MIT"
  head "https://github.com/guillerDev/macthermal.git", branch: "main"

  depends_on :macos

  def install
    system "make", "build"
    bin.install "macthermal"
  end

  test do
    assert_match "macthermal", shell_output("#{bin}/macthermal --help")
  end
end
