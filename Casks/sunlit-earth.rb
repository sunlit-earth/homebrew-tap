cask "sunlit-earth" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "e46ffee6f1952b543c17f95e963dda69f32228e45bda1bcbc95cfe7d0284ccb6",
         intel: "cdf7521a9d3b09b2a58ff1448c4be8432d884734168adcc0449f3f20578601bc"

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
