# My fish configuration

This I setup my shell on a fresh install. This is here mostly as my own memory aid.


## Basic idea

Persist only `~/.config/fish/config.fish` and `~/.config/fish/fish_plugins`. Don't put other files manually in the fish config directory manually. Let fisher handle that instead through its fishfile, which specifies which packages to install. This setup will install fisher automatically.


If a new file is needed, create a git repo and put it in there. Then add the repo url to the fish file and run fisher. In other words, create a fisher package.

If more evolved stuff is needed, self-bootstrap it in the `config.fish` file instead. This is already what happens with fisher and the scripts folder.


## installation

First install a bunch of stuff, package names may vary across distros:

```
# example for installing most of them on debian/mint/ubuntu
# apt install fish curl silversearcher-ag git vim httpie jq gron python3-pip ncdu fd-find build-essential zim percol

fish
curl
ag
git
vim
httpie
percol
ag
jq
gron
xsv
python3-pip
ncdu
fd-find
build-essential
vscode
zim
tq
ranger
fx
neovim
```

Then persist the files and make fish the default shell

```
curl https://raw.githubusercontent.com/plainas/myfishconfig/master/config.fish --create-dirs -sLo ~/.config/fish/config.fish
curl https://raw.githubusercontent.com/plainas/myfishconfig/master/fish_plugins --create-dirs -sLo ~/.config/fish/fish_plugins

chsh -s `which fish`
```

The fish config file will take care of the rest automatically:
  
  * install fisher
  * create ~/scripts folder and add it to $PATH

## Extra steps required for installation on OSX

Add fish to list of existing shells in ''/etc/shells'' before tunning chsh

Add brew path to fish user paths

```
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
```

More details here:
https://gist.github.com/gagarine/cf3f65f9be6aa0e105b184376f765262

## TODO

Persist the scripts folder. I am not sure I need or will use this much.
