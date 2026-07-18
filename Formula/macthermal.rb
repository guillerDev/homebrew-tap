class Macthermal < Formula
  desc "macOS temperature & fan-speed analyzer (reads the SMC via IOKit)"
  homepage "https://github.com/guillerDev/macthermal"
  url "https://github.com/guillerDev/macthermal/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "5d8873f268216789b50c6f530d482ea95aeae9d6c7f55f1796a46b4fb9f8e795"
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
