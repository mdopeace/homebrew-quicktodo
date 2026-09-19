# homebrew-quicktodo

Homebrew tap for [quicktodo](https://github.com/mdopeace/quicktodo) — a minimal menu-bar todo app for macOS.

## Install

```sh
brew tap mdopeace/quicktodo
brew install quicktodo
```

Launch:
```sh
open "$(brew --prefix)/opt/quicktodo/quicktodo.app"
```

## Auto-updates

The app checks for updates automatically on launch and when the menu opens. Use the **update indicator** in the footer (between progress tracker and Quit) to manually check and install updates.

## Formula

- `Formula/quicktodo.rb` — downloads pre-built `quicktodo.app.zip` from GitHub Releases
- Version updates via `./scripts/release.sh` in the main repo

## License

MIT — see [quicktodo](https://github.com/mdopeace/quicktodo) for details.