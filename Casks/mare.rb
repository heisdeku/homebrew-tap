cask "mare" do
  version "0.1.0"
  sha256 "260318e30bbfab96e7d21321ef1ce23b1d112f41f756af8df153d2e89d9eae3f"

  url "https://github.com/heisdeku/mare/releases/download/v#{version}/mare-#{version}-macos-universal.zip"
  name "marè"
  desc "See what is using your ports and disk, and clear space safely"
  homepage "https://github.com/heisdeku/mare"

  depends_on :macos

  app "marè.app"

  # The app isn't notarised, so macOS would refuse to open it on first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/marè.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Caches/dev.oluwaferanmi.mare",
    "~/Library/Saved Application State/dev.oluwaferanmi.mare.savedState",
    "~/Library/WebKit/dev.oluwaferanmi.mare",
  ]
end
