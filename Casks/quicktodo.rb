# frozen_string_literal: true

cask "quicktodo" do
  version "1.11.1"
  sha256 "45cb2dfb8c8583e5d80faf616cc64f38dd6bba57bae8c3c7abdf6e5693f2c544"

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
