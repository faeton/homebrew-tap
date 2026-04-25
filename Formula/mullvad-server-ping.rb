# typed: false
# frozen_string_literal: true

class MullvadServerPing < Formula
  include Language::Python::Virtualenv

  desc "Minimal stdlib-only CLI for ranking Mullvad relays by latency"
  homepage "https://github.com/faeton/mullvad-server-ping"
  url "https://github.com/faeton/mullvad-server-ping/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "af0dc51e98d09eec14221eb7af90d5fd568080604bd8770ad0192ebd2ee11608"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Ping Mullvad relays", shell_output("#{bin}/mullvad-server-ping --help")
  end
end
