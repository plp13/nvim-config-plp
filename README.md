# nvim-config-plp

This is my personal configuration file for NeoVim, which I created by following the excellent [YouTube tutorials](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) of chris@machine. It's simply a collection of configuration files that fit my own workflow, and it's provided AS-IS. It's definitely not intended to be a full NeoVim distribution such as LunarVim, and it's not even guaranteed to work out of the box.

## Requirements
1. Modern terminal that supports Unicode and 256 colours
2. The [Hack Nerd Mono](https://www.nerdfonts.com/) font

## Installation
1. Replace the contents of your ``~/.config/nvim/`` with the contents of this project (don't forget to back up your existing configuration first!)
2. Launch ``nvim``
3. Issue ``:PackerUpdate`` (first run might produce errors; just ignore them, restart nvim and issue ``:PackerUpdate`` again)
4. Issue ``:LspInstallInfo`` and then press ``U`` to update all installed servers

## Freshness
I strive to ``:PackerUpdate`` twice a month, fixing any issues that might arise with the configuration. Occasionally, I might even add new features.
