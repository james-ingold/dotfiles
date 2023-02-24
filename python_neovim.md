# Using Virtual Environments

If you do heavy Python development, you will most likely prefer using a virtual
environment. deoplete-jedi will display completions for your current shell's
Python interpreter (run: which python to determine this). This includes the
Python interpreter that are made active using a virtualenv.

If you are already using virtualenv for all of your work, it is recommended that
you use separate virtual environments for Neovim, and only Neovim. This will
remove the need to install the neovim package in each virtual environment. The
following examples uses pyenv. There are tips below for installing and using
pyenv without much effort. TODO: add instructions for pyvenv and virtualenv

```bash
pyenv install 2.7.11 pyenv install 3.4.4

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.4.4 neovim3

pyenv activate neovim2
pip install neovim
pyenv which python  # Note the path

pyenv activate neovim3
pip install neovim
pyenv which python  # Note the path

# The following is optional, and the neovim3 env is still active
# This allows flake8 to be available to linter plugins regardless
# of what env is currently active.  Repeat this pattern for other
# packages that provide cli programs that are used in Neovim.
pip install flake8
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH
```

Add to init.vim / vimrc

```vimscript
let g:python_host_prog = '/full/path/to/neovim2/bin/python'
let g:python3_host_prog = '/full/path/to/neovim3/bin/python'
```
