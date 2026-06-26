cask "macthermal" do
  version "0.4.2"
  sha256 "9e071d6e569d7d04b32bc5a43921c2e0aa3c3019e9025aab78d942eff82589f6"

  url "https://github.com/guillerDev/macthermal/releases/download/v#{version}/macthermal-app-v#{version}.zip"
  name "macthermal"
  desc "Menu-bar macOS temperature & fan-speed monitor"
  homepage "https://github.com/guillerDev/macthermal"

  depends_on macos: :ventura   # minimum macOS 13 (matches Info.plist LSMinimumSystemVersion)

  app "macthermal.app"

  caveats <<~EOS
    macthermal.app is ad-hoc signed (not notarized), so Gatekeeper blocks the
    first launch. To approve it once, either right-click the app in Finder and
    choose Open, or run:

      xattr -dr com.apple.quarantine "/Applications/macthermal.app"
  EOS
end
