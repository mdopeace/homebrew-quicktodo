class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.1.3/quicktodo.app.zip"
  sha256 "ec1015332f09a8c312dbdc3a8c3fd8d208bc1fa28c809fd3d1b5d4a55c7636ba"

  depends_on :macos

  def install
    # Extract zip manually to handle the quicktodo.app/ structure
    system "unzip", "-q", cached_download, "-d", "."
    libexec.install "quicktodo.app"
  end

  def caveats
    <<~EOS
      quicktodo.app installed to:
        \#{opt_libexec}/quicktodo.app

      To launch it:
        open "\#{opt_libexec}/quicktodo.app"

      To add to /Applications:
        cp -R "\#{opt_libexec}/quicktodo.app" /Applications/
    EOS
  end

  test do
    assert_predicate opt_libexec/"quicktodo.app/Contents/MacOS/QuickTodo", :executable?
  end
end
