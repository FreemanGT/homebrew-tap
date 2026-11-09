cask "freeflow-dictation" do
  version "1.7.4"
  sha256 "7d2cb56648f5561dc90625d6d13d3af037d7afd7cd6da8de57d94575aaaba2cf"

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
  depends_on macos: :sonoma

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
