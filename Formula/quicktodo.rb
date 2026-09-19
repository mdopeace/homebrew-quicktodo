class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.0.6/quicktodo.app.zip"
  sha256 "54cddffcf9041ef75b13144a0b2706f365e5b5a9cfd4bb80525afd59c9bdfb81"

  depends_on :macos

  def install
    # The zip contains quicktodo.app/ at root
    # Use libexec to avoid sandbox issues, then symlink
    libexec.install "quicktodo.app"
    bin.install_symlink libexec/"quicktodo.app/Contents/MacOS/QuickTodo" => "quicktodo"
  end

  def caveats
    <<~EOS
      quicktodo.app installed to:
        #{opt_prefix}/quicktodo.app

      To launch it:
        open "#{opt_prefix}/quicktodo.app"

      To add to /Applications, use "Check for Updates" in the app menu.

      A `quicktodo` symlink is also available in #{opt_bin} for CLI access.
    EOS
  end

  test do
    assert_predicate opt_prefix/"quicktodo.app/Contents/MacOS/QuickTodo", :executable?
  end
end
