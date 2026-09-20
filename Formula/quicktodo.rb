class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.1.4/quicktodo.app.zip"
  sha256 "5fab023cab7eb73e2f2510fd8168b5fe042cfc69eb2f3694eefe882ba7dffb79"

  depends_on :macos

  def install
    # Extract zip manually to handle the quicktodo.app/ structure
    system "unzip", "-q", cached_download, "-d", "."
    libexec.install "quicktodo.app"
  end

  def caveats
    <<~EOS
      quicktodo.app installed to:
        $(brew --prefix quicktodo)/libexec/quicktodo.app

      To launch it:
        open "$(brew --prefix quicktodo)/libexec/quicktodo.app"

      To add to /Applications:
        cp -R "$(brew --prefix quicktodo)/libexec/quicktodo.app" /Applications/
    EOS
  end

  test do
    assert_predicate opt_libexec/"quicktodo.app/Contents/MacOS/QuickTodo", :executable?
  end
end
