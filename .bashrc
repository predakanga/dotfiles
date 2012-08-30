# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR='mate'
export GIT_EDITOR='mate -wl1'
export TMPDIR='/var/tmp' # For PHP

## PATH
# Put /usr/local/{sbin,bin} first
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# bin folders from ~, gems, and Homebrew
for another_bin in \
    $HOME/bin \
    $HOME/bin-local \
    $HOME/bin/extras \
    $HOME/.gem/ruby/1.8/bin \
    "/Library/Application\ Support/VMware\ Fusion"
do
    [[ -e $another_bin ]] && export PATH=$another_bin:$PATH
done

if [[ -n `which brew` ]]; then
  # Find a Homebrew-built Python
  python_bin=$(brew --cellar python)/*/bin
  python_bin=`echo $python_bin`
  [[ -e $python_bin ]] && export PATH=$python_bin:$PATH

  [[ -e /usr/local/share/python ]] && export PATH=/usr/local/share/python:$PATH
  [[ -e /usr/local/lib/python ]] && export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH

  # Find a Homebrew-built Ruby
  ruby_bin=$(brew --cellar ruby)/*/bin
  ruby_bin=`echo $ruby_bin`
  [[ -e $ruby_bin ]] && export PATH=$ruby_bin:$PATH
fi


# No ._ files in archives please
export COPYFILE_DISABLE=true

## Tab Completions
set completion-ignore-case On

for comp in \
    /usr/local/etc/bash_completion \
    /usr/local/etc/bash_completion.d/git-completion.bash \
    ~/homebrew/Library/Contributions/brew_bash_completion.sh \
    ~/source/custom-django/extras/django_bash_completion
do
    [[ -e $comp ]] && source $comp
done

## Python stuff
export VIRTUALENV_USE_DISTRIBUTE
export WORKON_HOME=$HOME/env

# NPM stuff
export NODE_PATH="/usr/local/lib/node_modules:${NODE_PATH}"

# Android stuff
export PATH="/Users/lachlan/Development/android-sdk-macosx/tools:/Users/lachlan/Development/android-sdk-macosx/platform-tools:${PATH}"
