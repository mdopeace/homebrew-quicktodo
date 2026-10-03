class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.5.2/quicktodo.app.zip"
  sha256 "f987664eb719d24e873a3ee00db36ab2866997ff540e010c2ec0e01cc7d52e74"

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
