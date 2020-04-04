##########################################################################
# Bootstraping a script folder for all sorts of scripts in any language.
# All sorts of executable files to be precise, including binaries

if not test -e ~/scripts
    mkdir scripts
    echo "This file was added by my fish config. This folder is in the PATH, put all sorts of scripts and executable files in here. to have them in your" > ~/scripts/README.txt
end

set -x PATH $PATH ~/scripts

#TODO: automate script download, perhaps using a custom repository



##########################################################################
# This installs fisher automatically, in case it is not installed.
# I maintain a fishfile with the list of packages I want always installed
# Have to keep in mind to run fisher every now and then to sync the list
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


# this is my percol setup, press Ctrl+R to browse command history with percol
# enable this only if percol is available

if type -q percol
   function percol_select_history
      history|percol --result-bottom-up --prompt-bottom|read foo
      if [ $foo ]
        commandline $foo
      else
        commandline ''
      end
    end

    # this is suboptimal because I am am defining this function here
    # In fish versions prior to 3.0, this function doesn't need to be defined,
    # just put the bind command anywhere. For now, On my linux mint machine, fish 2.7.1 is still the suported version
    function fish_user_key_bindings
        bind \cr percol_select_history
    end
end
 
##########################################################
# a bunch of assorted functions 
function iadd -d "interactively add files to git staging area"
    git ls-files -m |percol|xargs git add
end

function ikill -d "kill processes interactively"
    ps aux | percol | awk '{ print $2 }' | xargs kill
end

function ishow -d "Interactively pick a git commit to show its diff"
    git log --oneline|percol |awk ' {print  $1}'|xargs git show
end