# Brewfile

This plugin attempts to keep your system updated with a [Brewfile](https://github.com/Homebrew/homebrew-bundle) (specified by URL).

By default the update will run any time a change in the content of the Brewfile is detected or whenever a specified interval is reached.

## Requirments
1. All requirements of [`brew bundle`](https://github.com/Homebrew/homebrew-bundle#requirements)
2. cURL > 7.68.0.

## Use
1. [Enable the plugin.](../README.md)
2. Set `BREWFILE_URL` to point to a valid public URL that returns a Brewfile. (optional)
```
BREWFILE_URL=https://gist.githubusercontent.com/rojopolis/16beb77d7d78707e481edf300eb3e3f7/raw/Brewfile
```
3. Set `BREWFILE_INTERVAL` to the desired number of days to wait between updates.
```
BREWFILE_INTERVAL=10
```