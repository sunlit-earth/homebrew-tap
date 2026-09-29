class SunlitEarth < Formula
  desc "View of Earth as seen from space as your wallpaper"
  homepage "https://github.com/sunlit-earth/sunlit-earth"
  version "0.2.2"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  on_arm do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.2.2/sunlit-earth-0.2.2-linux-aarch64.tar.gz"
    sha256 "aab1166b54e68d34949e69dd63444ef7d9ff555bf2d0ae113a1351740ff69f7d"
  end
  on_intel do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.2.2/sunlit-earth-0.2.2-linux-x86_64.tar.gz"
    sha256 "827e83d420812af5e45e9f32bba9be918a1cd85d0029ecb50e95bc69de6d4f8f"
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
