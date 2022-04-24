# [XMonad](https://xmonad.org/) - [Nord](https://www.nordtheme.com/)

My dotfiles. [Screenshots.](Screenshots/README.md)

## Fonts Used:

* Meslo LGS Nerd Font
* Ubuntu
* Font Awesome 6

## Software:

* [XMonad](https://xmonad.org/)
* [XMobar](https://github.com/jaor/xmobar)
* [Alacritty](https://github.com/alacritty/alacritty)
* [Dunst](https://github.com/dunst-project/dunst)
* [Udiskie](https://github.com/coldfix/udiskie)
* [Rofi](https://github.com/davatorium/rofi)
* [oh-my-zsh](https://ohmyz.sh/)
* [Powerlevel10K](https://github.com/romkatv/powerlevel10k)
* [Doom Emacs](https://github.com/hlissner/doom-emacs) (and [Emacs](https://www.gnu.org/software/emacs/))

## Wallpaper

No idea who made it; just googled ["nord wallpaper"](https://www.google.com/search?q=nord+wallpaper&tbm=isch). It's in the repository, [here](wallpaper.png).

## Install

###### **WARNING:** The install script is sort of broken, at the moment. Some of the packages don't install properly.

Install script only works on Arch, and should work on Arch-based distributions.

```bash
sh -c "$(curl -fsSL "https://raw.githubusercontent.com/Ekstropiya/Dotfiles/master/install.sh")"
```
###### **WARNING:** This *will* overwrite any existing config for the programs this will install.

After the install script has completed, you may choose to delete the ``.git`` directory. It may be useful if you want to be able to pull updates from this repository.
