> **Note**:
> Please read the below instructions carefully to extract the best result from this repo.


Initial Workstation Config
======================

## Table of Contents
- [What is this about?](#what-is-this-about)
- [Pre-requisites](#pre-requisites)
 - [Getting Ready to setup](#getting-ready)
 - [How to use it?](#how-to-use-it)
    - [Shell](#using-shell-aliases)
    - [VIM Aliases](#using-vim-aliases)
    - [TMux Aliases](#using-tmux-aliases)
- [Contributing](Contributing.md)
- [References](#references)
    - [Mac OS X](Mac-OS-X.md)
    - [Linux OS](Linux-OS.md)

## What is this about?
This is a Git repository to help you setup your new workstation for commonly used tools and make changes to them as you move ahead, using the power of Git & GitHub. 

The current steps cover some well known OSes used for development and have been tested on
1. Mac OS X (**Monterey: 12.3.1**)
2. Ubuntu (**Focal Fossa: 20.04 LTS**)
3. CentOS 7 (**7.5-1804**)
4. Fedora Workstation **28**
but it should work seamlessly on any variants lower or higher than the above.


## Pre-Requisites
1. A terminal app like **Linux Terminal**, **iTerm2**, **Tabby**
2. Any shell like Bash, Zsh, PowerShell or equivalent.
3. An IDE like [VSCode](https://code.visualstudio.com/) | [Atom Editor](https://atom.io)
4. SSH Keys
5. Git
6. GitHub Access
7. Tmux


## Getting Ready
1. If you use a Linux OS such as Ubuntu, Fedora, OpenSUSE or any similar ones OR Mac OS X or any of its variants, it will usually have a built-in shell with a terminal application to access it.
2. Obtaining VIM is as easy as mentioned in this **[website](https://www.sitepoint.com/getting-started-vim/)**
3. Tmux can be installed via this **[document](https://howchoo.com/g/ytkwotvkztq/using-the-iterm-2-and-tmux-integration)**.
4. You can follow the steps [**here**](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54) to generate SSH keys.
5. As per your OS (*Mac / Linux / Windows*), please follow these **[steps](https://linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)** to install Git.
6. Please add your SSH keys (*generated in step 4*) to GitHub via this **[page](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)**

## How to Use it?

1.  On a terminal, clone this repo locally using 
  `git clone git@github.com:vinayhegde1990/initial-workstation-config.git`
2.  Change your directory to the downloaded repo
  `cd initial-workstation-config`


## Using Shell Aliases
1.  Copy all the files from the `.bash_profile .bashrc` in the downloaded git repo  to your home directory.
2.  Run the `source ~/.bash_profile && source ~/.bashrc` to get the Bash aliases in effect.
3.  Alternatively, you can also close all Shell sessions and restart them to achieve the same.


## Using Vim Aliases
1. Copy `.vimrc` from downloaded repo to **$HOME** & ensure `.vim` folder (_with all files_) exists there as well.
2. If you already have a VIM process running, you can go into Escape mode by pressing `Esc`, type `:` and then write `source:~/.vimrc`
3. For a new VIM session, the changes will automatically apply themselves.

## Using Tmux Aliases
1. Copy all the files from the `.tmux/` in the downloaded git repo to your home directory.
2. If you already have a Tmux process running, you can go into Escape mode by pressing `Esc`, type `:` and then write `source-file :~/.tmux/tmux.conf`
3. For a new Tmux session, the changes will automatically apply themselves.

## References
Cheers to respective maintainers of cited resources without which creating this repo would've been impossible.
