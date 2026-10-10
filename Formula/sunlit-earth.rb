class SunlitEarth < Formula
  desc "View of Earth as seen from space as your wallpaper"
  homepage "https://github.com/sunlit-earth/sunlit-earth"
  version "0.3.0"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  on_arm do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.3.0/sunlit-earth-0.3.0-linux-aarch64.tar.gz"
    sha256 "1bf2ae83489d0dc85f7cc5c07a2a182cf16b2df542825c66d0c2b7a3400c9cf0"
  end
  on_intel do
    url "https://github.com/sunlit-earth/sunlit-earth/releases/download/v0.3.0/sunlit-earth-0.3.0-linux-x86_64.tar.gz"
    sha256 "f1a9e8572740ae700962ea25bfbef25a16e4d4ca41560b882ae518dc77dc016c"
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
