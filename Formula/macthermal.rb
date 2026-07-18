class Macthermal < Formula
  desc "macOS temperature & fan-speed analyzer (reads the SMC via IOKit)"
  homepage "https://github.com/guillerDev/macthermal"
  url "https://github.com/guillerDev/macthermal/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f7661975c62324c4154beb909b33128070d8331051489c772d24fe2562a9f670"
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
