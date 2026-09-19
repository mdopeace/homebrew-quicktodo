class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.1.0/quicktodo.app.zip"
  sha256 "42436183baa5c0fb8f9b99e764c73a0e9d35a5992e9e3a7ed70756ee8b6d0ab2"

  depends_on :macos

  def install
    # Extract zip manually to handle the quicktodo.app/ structure
    system "unzip", "-q", cached_download, "-d", "."
    libexec.install "quicktodo.app"
    # Symlink for convenient launch
    (prefix/"quicktodo.app").make_symlink libexec/"quicktodo.app"
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
