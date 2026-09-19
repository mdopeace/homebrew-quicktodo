# Homebrew tap for quicktodo

Homebrew tap for [quicktodo](https://github.com/mdopeace/quicktodo), a minimal
menu-bar todo app for macOS.

## Install

```sh
brew tap mdopeace/quicktodo
brew install quicktodo
```

After install, launch the Homebrew-managed app with:

```sh
open "$(brew --prefix)/opt/quicktodo/quicktodo.app"
```

To copy the app into `/Applications`, replacing the existing `quicktodo.app` there:

```sh
cp -R "$(brew --prefix)/opt/quicktodo/quicktodo.app" /Applications/
```

The Homebrew formula cannot perform this copy itself because formula
installation runs in a sandbox. You can also use quicktodo's **Check for Updates**
command to install a release into `/Applications`.

Homebrew upgrades update the managed bundle under `opt/quicktodo/quicktodo.app`.

> **Note:** this tap installs a **formula**, so the command is `brew install quicktodo`
> (no `--cask`). A pre-built, notarized cask is not currently provided.

## In a Brewfile

```ruby
tap "mdopeace/quicktodo"
brew "quicktodo"
```

## Updating

When a new [quicktodo release](https://github.com/mdopeace/quicktodo/releases) is tagged, bump
the `version`/`url`/`sha256` in `Formula/quicktodo.rb`.

## Contributing

`main` is branch-protected — open a pull request with any changes.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).