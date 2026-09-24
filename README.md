# Sunlit Earth for Homebrew

The [Homebrew](https://brew.sh) tap for [Sunlit Earth](https://github.com/sunlit-earth/sunlit-earth), a view of Earth as seen from space as your wallpaper.

On macOS:

```sh
brew install --cask sunlit-earth/tap/sunlit-earth
```

On Linux:

```sh
brew install sunlit-earth/tap/sunlit-earth
```

`brew upgrade` keeps it up to date, and `brew uninstall sunlit-earth` removes it.

The macOS app is not notarized by Apple. The cask removes the quarantine attribute Homebrew sets on the download, so the app starts without Gatekeeper asking you to allow it in System Settings.

The formula and the cask are written by the release pipeline of the main repository on every stable release. Please do not edit them by hand, and report problems at https://github.com/sunlit-earth/sunlit-earth/issues.
