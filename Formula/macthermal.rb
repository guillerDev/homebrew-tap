class Macthermal < Formula
  desc "macOS temperature & fan-speed analyzer (reads the SMC via IOKit)"
  homepage "https://github.com/guillerDev/macthermal"
  url "https://github.com/guillerDev/macthermal/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "6c09c391ba926ccccf365e46018b972702e8af3b711b961e426da6d0db9278f9"
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
