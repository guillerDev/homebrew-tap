cask "macthermal" do
  version "0.4.0"
  sha256 "03f6e8b0350bd47062dd6a3f567d8d9f5b0f71688f8cf776bd9401e6d06df218"

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
