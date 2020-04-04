# My fish configuration

This I setup my shell on a fresh install. This is here mostly as my own memory aid.


## Basic idea

Persist only ''~/.config/fish/config.fish'' and ''~/.config/fish/config.fish''. Don't put other files manually in the fish config directory manually. Let fisher handle that instead through its fishfile, which specifies which packages to install. This setup will install fisher automatically.


If a new file is needed, create a git repo and put it in there. Then add the repo url to the fish file and run fisher. In other words, create a fisher package.

If more evolved stuff is needed, self-bootstrap it in the ''config.fish'' file instead. This is already what happens with fisher and the scripts folder.


# installation

First install a bunch of stuff, package names may vary across distros:

```
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
tq
ranger
```

Then persist the files and make fish the default shell

```
curl https://raw.githubusercontent.com/plainas/myfishconfig/master/config.fish --create-dirs -sLo ~/.config/fish/config.fish
curl https://raw.githubusercontent.com/plainas/myfishconfig/master/fishfile --create-dirs -sLo ~/.config/fish/fishfile

chsh -s `which fish`
```

The fish config file will take care of the rest automatically:
  
  * install fisher
  * create ~/scripts folder and add it to $PATH


## TODO

Persist the scripts folder. I am not sure I need or will use this much.