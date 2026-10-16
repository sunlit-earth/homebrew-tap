class SunlitEarth < Formula
  desc "View of Earth as seen from space as your wallpaper"
  homepage "https://github.com/sunlit-earth/sunlit-earth"
  version "0.4.0"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  on_arm do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.4.0/sunlit-earth-0.4.0-linux-aarch64.tar.gz"
    sha256 "d1b8574dff4d88950b461843e5dedca70fa59266d6c2a3af7df610f4b3e664af"
  end
  on_intel do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.4.0/sunlit-earth-0.4.0-linux-x86_64.tar.gz"
    sha256 "534923f7793b89f54ab256e797cd8406af7aa2a477086741e54378a3fb21b1d6"
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
