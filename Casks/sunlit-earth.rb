cask "sunlit-earth" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "7949a1dd7bb2813fa0316a9b50edf77fb03d22867d2cf9f4bf4527c7756c746a",
         intel: "205cd3c2f5992ccedd3c7c4751d29ccd6f533b039ff4dd285054a839e613cb77"

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
