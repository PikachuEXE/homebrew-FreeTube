cask "pikachuexe-freetube" do
  version "0.21.3"
  sha256 "8a60eaccc2d7ea8ce9b9ac6958aa3583e8d38053abdbeeda2cc5bb4bdb14a383"

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
  depends_on macos: ">= :high_sierra"

  app "FreeTube.app"

  uninstall quit: "io.freetubeapp.freetube"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/io.freetubeapp.freetube.sfl*",
    "~/Library/Application Support/FreeTube",
    "~/Library/Preferences/io.freetubeapp.freetube.plist",
    "~/Library/Saved Application State/io.freetubeapp.freetube.savedState",
  ]
end
