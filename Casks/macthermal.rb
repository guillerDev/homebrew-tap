cask "macthermal" do
  version "0.3.0"
  sha256 "9b92b0c3a5865f70bd6603d2842fb62e1779ea030ca5050afa1dbffe1586713d"

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
