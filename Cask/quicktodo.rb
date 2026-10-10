cask "quicktodo" do
  version "1.9.0"
  sha256 "52a0ec6c3c48aaf7c7121ca67397a8f4c857d3f5436550859521161a159858c8"

  url "https://github.com/mdopeace/quicktodo/releases/download/v1.9.0/quicktodo.app.zip"
  name "QuickTodo"
  desc "Minimal menu-bar todo app"
  homepage "https://github.com/mdopeace/quicktodo"

  depends_on macos: ">= :ventura"

  app "quicktodo.app"

  # No `auto_updates true` on purpose: that stanza excludes the cask from
  # `brew upgrade` and defers to the app's own updater. We want brew to upgrade
  # it as well. The tap is bumped in lockstep with every release, so both paths
  # converge on the same version.
end
