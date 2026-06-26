class Macthermal < Formula
  desc "macOS temperature & fan-speed analyzer (reads the SMC via IOKit)"
  homepage "https://github.com/guillerDev/macthermal"
  url "https://github.com/guillerDev/macthermal/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "54bed0cee0c505b80c464c6e5820e75297b75f2d77bfacb7d1b84fdab05137b7"
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
