cask "pikachuexe-freetube" do
  version "0.23.12"
  sha256 "6b70398d0453186b0f2087ac684eebb0c17eb847c75f4ed4e1507cea6d8eed47"

  url "https://github.com/FreeTubeApp/FreeTube/releases/download/v#{version}-beta/freetube-#{version}-beta-mac-arm64.dmg"
  name "FreeTube"
  desc "YouTube player focusing on privacy"
  homepage "https://github.com/FreeTubeApp/FreeTube"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)/i)
  end

  conflicts_with cask: "freetube"
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "FreeTube.app"

  postflight do
    ohai "Releasing #{token} from quarantine"
    system_command("/usr/bin/xattr",
                   args: [
                     "-dr",
                     "com.apple.quarantine",
                     "#{appdir}/FreeTube.app",
                   ])
  end

  uninstall quit: "io.freetubeapp.freetube"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/io.freetubeapp.freetube.sfl*",
    "~/Library/Application Support/FreeTube",
    "~/Library/Preferences/io.freetubeapp.freetube.plist",
    "~/Library/Saved Application State/io.freetubeapp.freetube.savedState",
  ]

  caveats <<~EOS
    Warning: macOS's Gatekeeper has been disabled for this Cask

    According to the vendor, the Gatekeeper quarantine attribute breaks the app and needs to be removed. This Cask, `#{token}`, automatically removes the quarantine attribute. No further action is required.

    For more information:
    - https://docs.freetubeapp.io/faq/#macos-freetube-is-damaged-and-cant-be-opened-you-should-move-it-to-the-trash
    - https://docs.brew.sh/FAQ#why-cant-i-open-a-mac-app-from-an-unidentified-developer
  EOS
end
