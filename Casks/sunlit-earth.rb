cask "sunlit-earth" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "4c892dc22c859534d0894dc8e769531f35933475157afb0a1d77faf0d2b0fc5d",
         intel: "b310e16dcae800afd7be8814a663fd017e128daad7b97c8a333950dc6d8ede56"

  url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v#{version}/sunlit-earth-#{version}-macos-#{arch}-app.zip"
  name "Sunlit Earth"
  desc "View of Earth as seen from space as your wallpaper"
  homepage "https://github.com/sunlit-earth/sunlit-earth"

  livecheck do
    url "https://github.com/sunlit-earth/sunlit-earth"
    strategy :github_latest
  end

  depends_on :macos

  app "sunlit-earth-#{version}-macos-#{arch}-app/Sunlit Earth.app"
  binary "#{appdir}/Sunlit Earth.app/Contents/MacOS/sunlit-earth"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Sunlit Earth.app"]
  end

  uninstall quit: "earth.sunlit.SunlitEarth"

  zap trash: "~/Library/Application Support/SunlitEarth"
end
