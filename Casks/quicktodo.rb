# frozen_string_literal: true

cask "quicktodo" do
  version "1.14.0"
  sha256 "edf785e30aab3b9a38dba3df83dbef324dccd22c536ff1ee5ea987cceb6ddef5"

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
