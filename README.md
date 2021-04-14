# omz-plugins

These are some random [oh-my-zsh](https://ohmyz.sh/) plugins that may be useful.

To use these plugins:
1.  Install Zsh, oh-my-zsh, and other utilities you may need.
2.  Clone this repo to the `custom` directory of your OMZ installation.  This might work:
```
rm -rf $ZSH_CUSTOM
git clone git@github.com:rojopolis/omz-plugins.git $ZSH_CUSTOM
```
3. Add to your plugin list in ~/.zshrc.  Here's one way you might do that:
```
plugins=($(ls $ZSH_CUSTOM/plugins))
```
4.  Open a new shell to take effect.