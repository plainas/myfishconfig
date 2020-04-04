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
curl insert_url_here --create-dirs -sLo ~/.config/fish/config.fish
curl insert_url_here --create-dirs -sLo ~/.config/fish/fishfile

chsh -s `which fish`
```