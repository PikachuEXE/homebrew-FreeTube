cask "pikachuexe-freetube" do
  version "0.23.3"
  sha256 "6deccaae5b298239f0ba620ea9f92580801284c104981d52a722c7da3d700c89"

  url "https://github.com/PikachuEXE/homebrew-FreeTube/releases/download/v#{version}-beta/freetube-#{version}-mac-arm64.dmg"
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

  uninstall quit: "io.freetubeapp.freetube"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/io.freetubeapp.freetube.sfl*",
    "~/Library/Application Support/FreeTube",
    "~/Library/Preferences/io.freetubeapp.freetube.plist",
    "~/Library/Saved Application State/io.freetubeapp.freetube.savedState",
  ]
end
