cask "sunlit-earth" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "5ca351a3ec513ecc15863a456e2c7ca2d55bbea84fd62c62d8660ffaf8adde9c",
         intel: "7200f03b7eea66cbc1f8e7ab700db01bcb2a9b1fb86056ccb77b140771a507a4"

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
