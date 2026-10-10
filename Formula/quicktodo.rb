class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.9.0/quicktodo.app.zip"
  sha256 "52a0ec6c3c48aaf7c7121ca67397a8f4c857d3f5436550859521161a159858c8"

  depends_on :macos

  def install
    # Extract zip manually to handle the quicktodo.app/ structure
    system "unzip", "-q", cached_download, "-d", "."
    libexec.install "quicktodo.app"
  end

  def caveats
    <<~EOS
      quicktodo.app installed to:
        /opt/homebrew/opt/quicktodo/libexec/quicktodo.app

      To launch it:
        open "/opt/homebrew/opt/quicktodo/libexec/quicktodo.app"

      To add to /Applications:
        cp -R "/opt/homebrew/opt/quicktodo/libexec/quicktodo.app" /Applications/
    EOS
  end

  test do
    assert_predicate opt_libexec/"quicktodo.app/Contents/MacOS/QuickTodo", :executable?
  end
end
