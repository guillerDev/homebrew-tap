# Homebrew Cask template for MacPower.
#
# Copy this to your tap repo at:  <owner>/homebrew-tap/Casks/macpower.rb
# Replace guillerDev with your GitHub username/org. The Release workflow then keeps
# `version` and `sha256` up to date automatically on each tagged release.
cask "macpower" do
  version "1.0.2"
  sha256 "14a437866d9b6f54ea50c554c6ccb4a0aef6c9ad15846ba5896f9f5440c7160e"

  url "https://github.com/guillerDev/macpower/releases/download/v#{version}/MacPower-v#{version}.zip"
  name "MacPower"
  desc "Live macOS power-consumption visualiser (no root required)"
  homepage "https://github.com/guillerDev/macpower"

  depends_on macos: ">= :sonoma"   # macOS 14+

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
