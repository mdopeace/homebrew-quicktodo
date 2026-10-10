# Homebrew tap for quicktodo

Homebrew tap for [quicktodo](https://github.com/mdopeace/quicktodo), a minimal
menu-bar todo app for macOS.

## Install

```sh
brew tap mdopeace/quicktodo
brew install --cask quicktodo
```

This installs `quicktodo.app` into `/Applications`. The `--cask` flag is
optional — plain `brew install quicktodo` finds it too.

There is no manual copy step: a cask writes to `/Applications` directly, which a
formula cannot (formula installs run in a sandbox under `opt/`).

## Updating

```sh
brew update && brew upgrade quicktodo
```

quicktodo also updates itself. It checks for a new
[release](https://github.com/mdopeace/quicktodo/releases) on launch and when you
open the menu (menu-open checks are limited to once every 4 hours); the footer
button can also trigger a manual check.

Both routes install the same build. Homebrew keeps its own record of the
installed version, so that record can fall out of step with an in-app update.
`brew reinstall --cask quicktodo` re-points it at the tap's version — which
rolls the app back if the tap hasn't published that version yet, so check
`brew info --cask quicktodo` first if you just updated in-app.

Your todos live in `~/Library/Application Support/QuickTodo/todos.json`, outside
both `/Applications` and Homebrew's Caskroom, so they survive reinstalls.

## Migrating from the formula

Earlier versions shipped a formula, which installed the app under `opt/` and
asked you to copy it into `/Applications` by hand. The tap now ships a cask.

On Homebrew 5.0.6+ `brew update` migrates the formula to the cask for you. It
fails if a copy is already sitting in `/Applications` — exactly what the old
manual step left behind — so remove it first:

```sh
rm -rf /Applications/quicktodo.app
brew uninstall quicktodo
brew install --cask quicktodo
```

Your todos live in `~/Library/Application Support/QuickTodo/todos.json`, outside
everything above, so none of this touches them.

## In a Brewfile

```ruby
tap "mdopeace/quicktodo"
cask "quicktodo"
```

## Maintaining

`version`/`url`/`sha256` in `Cask/quicktodo.rb` are updated automatically by
`scripts/release.sh` in the [app repo](https://github.com/mdopeace/quicktodo) on
every tagged release, so they normally need no hand-editing.

## Contributing

`main` is branch-protected — open a pull request with any changes.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).