cask "macthermal" do
  version "0.5.0"
  sha256 "aff5c63a7681ccc13f90f6ef25154fd937d4e5e143ee2e8756b8464f66c48d7c"

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
