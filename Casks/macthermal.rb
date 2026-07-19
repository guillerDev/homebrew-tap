cask "macthermal" do
  version "0.5.2"
  sha256 "bbcc20e89217e703d92db2c81918d5df171641e67b77bc33abce41961deb4d68"

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
