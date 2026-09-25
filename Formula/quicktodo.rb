class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.4.1/quicktodo.app.zip"
  sha256 "1b4307b7653f08520c3c6f6f23443ddf3165a8540a41d535a9870106c84911fd"

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
