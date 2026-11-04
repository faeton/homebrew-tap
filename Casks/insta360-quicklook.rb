cask "insta360-quicklook" do
  version "0.1.0"
  sha256 "b846c6bc2fdb005d691e0d79a7b38189fafb1c6fb50580eafe076003233c1744"

  url "https://github.com/faeton/insta360-quicklook/releases/download/v#{version}/Insta360QuickLook-v#{version}.zip"
  name "Insta360 QuickLook"
  desc "Native Quick Look thumbnails and previews for Insta360 .insv/.insp/.lrv"
  homepage "https://github.com/faeton/insta360-quicklook"

  disable! date: "2026-11-04", because: "conflicts with the Quick Look plugin in Insta360 Studio"

  depends_on macos: :ventura

  app "Insta360QuickLook.app"

  uninstall quit: "com.faeton.insta360quicklook"

  zap trash: [
    "~/Library/Application Support/Insta360QL",
    "~/Library/Caches/com.faeton.insta360quicklook",
  ]
end
