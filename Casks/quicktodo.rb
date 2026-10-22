# frozen_string_literal: true

cask "quicktodo" do
  version "1.13.0"
  sha256 "8807435bf73d4c93cbc4fbb485525b7c062f4c3b37e9a5502b1301c2b812300a"

  url "https://github.com/mdopeace/quicktodo/releases/download/v#{version}/quicktodo.app.zip"
  name "QuickTodo"
  desc "Minimal menu-bar todo app"
  homepage "https://github.com/mdopeace/quicktodo"

  depends_on macos: :ventura

  app "quicktodo.app"

  # Ad-hoc signed, not notarized, so Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/quicktodo.app"],
        must_succeed: false
  end
end
