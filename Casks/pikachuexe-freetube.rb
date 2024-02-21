cask "pikachuexe-freetube" do
  arch arm: "arm64", intel: "x64"

  version "0.19.1"

  on_arm do
    sha256 "fc07b1f0dbe86f7cb70a0398cf14651a955e053a3d71f22b4b94d24dcd1ff8da"

    url "https://github.com/PikachuEXE/homebrew-FreeTube/releases/download/v#{version}-beta/freetube-#{version}-mac-#{arch}.dmg"
  end
  on_intel do
    sha256 "4a8f77000e01a6123a3252f5217744d6e9836f78642c222081917e2318fa1c60"

    url "https://github.com/FreeTubeApp/FreeTube/releases/download/v#{version}-beta/freetube-#{version}-mac-#{arch}.dmg"
  end

  name "FreeTube"
  desc "YouTube player focusing on privacy"
  homepage "https://github.com/FreeTubeApp/FreeTube"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)/i)
  end

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
