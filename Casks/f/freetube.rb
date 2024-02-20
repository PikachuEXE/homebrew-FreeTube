cask "freetube" do
  # Change this when release contains arm64 version
  arch arm: "x64", x86_64: "x64"
  
  version "0.19.1"
  sha256 x86_64: "4a8f77000e01a6123a3252f5217744d6e9836f78642c222081917e2318fa1c60"

  url "https://github.com/FreeTubeApp/FreeTube/releases/download/v#{version}-beta/freetube-#{version}-mac-#{arch}.dmg",
    verified: "https://github.com/FreeTubeApp/FreeTube/releases/download/"
  name "FreeTube"
  desc "The Private YouTube Client"
  homepage "https://freetubeapp.io"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: ">= :el_capitan"

  app "FreeTube.app"

  zap trash: [
    "~/Library/Application Support/FreeTube",
  ]
end
