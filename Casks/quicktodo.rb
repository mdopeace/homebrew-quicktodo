# frozen_string_literal: true

cask "quicktodo" do
  version "1.12.0"
  sha256 "420f0afd71d9735798f9bf7022a204d0158dbdaa99cb1d974f39dc86f2531c8e"

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
