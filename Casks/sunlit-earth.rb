cask "sunlit-earth" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.2"
  sha256 arm:   "9f6b8ad91b687e6b71820937b9bde470f9853a77446bec55feebe69fb89d33df",
         intel: "58e7d908decd37c3d04ca97e0846dc10f8c813eb79db15e17b52477f881d1cee"

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
