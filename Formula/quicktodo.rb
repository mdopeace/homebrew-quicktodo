class Quicktodo < Formula
  desc "Minimal menu-bar todo app for macOS"
  homepage "https://github.com/mdopeace/quicktodo"
  url "https://github.com/mdopeace/quicktodo/releases/download/v1.0.4/quicktodo-v1.0.4.tar.gz"
  sha256 "8eaaee42ba07967edcae7526a60caf25bca84b6c3f6e547a2e8843d74c6c33f4"

  depends_on :macos
  depends_on :xcode => :build

  def install
    system "./scripts/package.sh", "local"
    prefix.install "dist/quicktodo.app"
  end

  def caveats
    <<~EOS
      quicktodo.app installed to:
        #{opt_prefix}/quicktodo.app

      To launch:
        open "#{opt_prefix}/quicktodo.app"

      To add to /Applications, use "Check for Updates" in the app menu.
    EOS
  end

  test do
    assert_predicate opt_prefix/"quicktodo.app/Contents/MacOS/QuickTodo", :executable?
  end
end