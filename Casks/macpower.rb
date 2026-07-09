# Homebrew Cask template for MacPower.
#
# Copy this to your tap repo at:  <owner>/homebrew-tap/Casks/macpower.rb
# Replace guillerDev with your GitHub username/org. The Release workflow then keeps
# `version` and `sha256` up to date automatically on each tagged release.
cask "macpower" do
  version "1.0.5"
  sha256 "b64de73206acf8baeca9e85e5a5e98a63cefa8ce06d413c7bc0c5f12f5b62cf0"

  url "https://github.com/guillerDev/macpower/releases/download/v#{version}/MacPower-v#{version}.zip"
  name "MacPower"
  desc "Live macOS power-consumption visualiser (no root required)"
  homepage "https://github.com/guillerDev/macpower"

  depends_on macos: :sonoma   # macOS 14 (Sonoma) or newer

  app "MacPower.app"

  zap trash: [
    "~/Library/Preferences/com.macpower.app.plist",
  ]

  caveats <<~EOS
    MacPower is ad-hoc signed (not notarized). If macOS blocks it on first
    launch, clear the download quarantine:

      xattr -dr com.apple.quarantine "#{appdir}/MacPower.app"

    The optional "Exact energy" mode installs a passwordless-sudo rule at
    /etc/sudoers.d/macpower via an admin prompt. To remove it:

      sudo rm /etc/sudoers.d/macpower
  EOS
end
