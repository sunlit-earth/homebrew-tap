class SunlitEarth < Formula
  desc "View of Earth as seen from space as your wallpaper"
  homepage "https://github.com/sunlit-earth/sunlit-earth"
  version "0.2.1"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  on_arm do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.2.1/sunlit-earth-0.2.1-linux-aarch64.tar.gz"
    sha256 "a39075ec864b4ee2d2e9181933ffc934dbb746d598c03b92a6eac8f8c2f8675c"
  end
  on_intel do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.2.1/sunlit-earth-0.2.1-linux-x86_64.tar.gz"
    sha256 "ea3f5ae6d3eeeee8675aa8b933bf0188f85ec5f81d2bf8f2d1a6e101681783cc"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"sunlit-earth"
  end

  def caveats
    <<~EOS
      To add Sunlit Earth to your desktop's application menu, run:
        #{opt_libexec}/assets/linux/install-user.sh --exec #{opt_bin}/sunlit-earth
      Before uninstalling, remove the entry again with:
        #{opt_libexec}/assets/linux/install-user.sh --uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sunlit-earth --version")
  end
end
