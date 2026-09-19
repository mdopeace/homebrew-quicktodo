class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.0.8/quicktodo.app.zip"
  sha256 "53c265b7a06a9592d9306cbacd9089253050a094448b78c47f2282a15c141a4a"

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
