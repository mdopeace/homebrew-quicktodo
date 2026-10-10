# frozen_string_literal: true

cask "quicktodo" do
  version "1.9.0"
  sha256 "52a0ec6c3c48aaf7c7121ca67397a8f4c857d3f5436550859521161a159858c8"

  url "https://github.com/mdopeace/quicktodo/releases/download/v#{version}/quicktodo.app.zip"
  name "QuickTodo"
  desc "Minimal menu-bar todo app"
  homepage "https://github.com/mdopeace/quicktodo"

  depends_on macos: :ventura

  app "quicktodo.app"

  # Ad-hoc signed, not notarized, so Gatekeeper blocks the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                  args: ["-dr", "com.apple.quarantine", "#{appdir}/quicktodo.app"]
  end
end
