class SunlitEarth < Formula
  desc "View of Earth as seen from space as your wallpaper"
  homepage "https://github.com/sunlit-earth/sunlit-earth"
  version "0.2.0"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  on_arm do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.2.0/sunlit-earth-0.2.0-linux-aarch64.tar.gz"
    sha256 "19ebe8ca35b811f4edd76fa82208f6b39b6d9767d9ba1d03740fc7aa1e6ca1d5"
  end
  on_intel do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.2.0/sunlit-earth-0.2.0-linux-x86_64.tar.gz"
    sha256 "de1fd931b96f7d90cc3d0bb11b2eaafdde07d000d0735cb7862db359be445546"
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
