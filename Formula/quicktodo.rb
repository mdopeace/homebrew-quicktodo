class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.1.2/quicktodo.app.zip"
  sha256 "11b09277f409164d8168df32996112c8d16aaaf17fb25e27760c63746de05c9f"

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
