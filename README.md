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
    - [Linux OS](Linux-OS.md)

## What is this about?
This is a Git repository to help you setup your new workstation for commonly used tools and make changes to them as you move ahead, using the power of Git & GitHub. 

The current steps cover some well known OSes used for development and have been tested on
1. Mac OS X (**Monterey: 12.3.1**)
1. Ubuntu (**Focal Fossa: 20.04 LTS**)
1. CentOS 7 (**7.5-1804**)
1. Fedora Workstation **28**
but it should work seamlessly on any variants lower or higher than the above.


## Pre-Requisites
1. A terminal app like **Linux Terminal**, **iTerm2**, **Tabby**
1. Any shell like Bash, Zsh, PowerShell or equivalent.
1. An IDE like [VSCode](https://code.visualstudio.com/)
1. SSH | GPG Keys
1. Git
1. GitHub Access
1. Tmux


## Getting Ready
As per your OS (*Mac / Linux / Windows*):

1. Linux OS like Ubuntu, Fedora OR Mac OS X, have a built-in shell with a terminal application. The Windows equivalent would be PowerShell.
1. Obtaining VIM is as easy as mentioned in this **[website](https://www.sitepoint.com/getting-started-vim/)**
1. You can **[generate SSH keys](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54)** and similarly **[create GPG keys](https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff/)**.
1. Please follow these **[steps](https://linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)** to install Git.
1. Then, **[add SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)** and then **[GPG keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)** to Github
1. Tmux can be installed via this **[document](https://howchoo.com/g/ytkwotvkztq/using-the-iterm-2-and-tmux-integration)**.

## How to Use it?

1.  On a terminal, clone this repo locally using 
  `git clone git@github.com:vinayhegde1990/initial-workstation-config.git`
1.  Change your directory to the downloaded repo
  `cd initial-workstation-config`


## Using Shell Aliases
1.  Copy all the files from the `aliases, .bash_profile, .bashrc` in the downloaded git repo  to your home directory.
1.  Run the `source ~/.bash_profile && source ~/.bashrc` to get the Bash aliases in effect.
1.  Alternatively, you can also close all Shell sessions and restart them to achieve the same.


## Using Vim Aliases
1. Copy `.vimrc` from downloaded repo to **$HOME** & ensure `.vim` folder (_with all files_) exists there as well.
1. If you already have a VIM process running, you can go into Escape mode by pressing `Esc`, type `:` and then write `source:~/.vimrc`
1. For a new VIM session, the changes will automatically apply themselves.

## Using Tmux Aliases
1. Copy all the files from the `.tmux/` in the downloaded git repo to your home directory.
1. If you already have a Tmux process running, you can go into Escape mode by pressing `Esc`, type `:` and then write `source-file :~/.tmux/tmux.conf`
1. For a new Tmux session, the changes will automatically apply themselves.

## References
Cheers to respective maintainers of cited resources that helped in creating this repo.
