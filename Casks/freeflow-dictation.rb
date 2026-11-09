cask "freeflow-dictation" do
  version "1.7.3"
  sha256 "3180f8b7ddebecf0b9e9f6217033619a6cb65ed80c0991a6dcb7ecc704b0a2b6"

  url "https://dl.freeflow.audio/FreeFlow-#{version}.dmg"
  name "FreeFlow Dictation"
  desc "On-device voice dictation with a Claude Code hook"
  homepage "https://freeflow.audio/"

  livecheck do
    url "https://freeflow.audio/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "FreeFlow.app"

  uninstall quit: "com.freemans.freeflow"

  zap trash: [
    "~/Library/Application Support/FreeFlow",
    "~/Library/Caches/com.freemans.freeflow",
    "~/Library/HTTPStorages/com.freemans.freeflow",
    "~/Library/Preferences/com.freemans.freeflow.plist",
    "~/Library/Saved Application State/com.freemans.freeflow.savedState",
  ]
end
