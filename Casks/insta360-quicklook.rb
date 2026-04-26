cask "insta360-quicklook" do
  version "0.1.0"
  sha256 "b846c6bc2fdb005d691e0d79a7b38189fafb1c6fb50580eafe076003233c1744"

  url "https://github.com/faeton/insta360-quicklook/releases/download/v#{version}/Insta360QuickLook-v#{version}.zip"
  name "Insta360 QuickLook"
  desc "Native Quick Look thumbnails and previews for Insta360 .insv/.insp/.lrv"
  homepage "https://github.com/faeton/insta360-quicklook"

  depends_on macos: ">= :ventura"

  app "Insta360QuickLook.app"

  postflight do
    lsreg = "/System/Library/Frameworks/CoreServices.framework/Versions/A/" \
            "Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
    installed = "#{appdir}/Insta360QuickLook.app"
    system_command lsreg, args: ["-f", installed]
    Dir["#{installed}/Contents/PlugIns/*.appex"].each do |ext|
      system_command "/usr/bin/pluginkit", args: ["-a", ext]
    end
    system_command "/usr/bin/qlmanage", args: ["-r"]
    system_command "/usr/bin/qlmanage", args: ["-r", "cache"]
  end

  uninstall quit: "com.faeton.insta360quicklook"

  zap trash: [
    "~/Library/Application Support/Insta360QL",
    "~/Library/Caches/com.faeton.insta360quicklook",
  ]

  caveats <<~EOS
    One-time setup required:
      System Settings → General → Login Items & Extensions → Quick Look
      Toggle ON "Insta360 QuickLook" (Thumbnail and Preview both appear).
  EOS
end
