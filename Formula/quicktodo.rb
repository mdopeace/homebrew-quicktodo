class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.0.10/quicktodo.app.zip"
  sha256 "c19cca29dbdbcd48799d7153610da536c1c0e073283fe79cd81e18cd30bde345"

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
