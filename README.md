Initial Workstation Config
======================

## Table of Contents
- [What is this about?](#what-is-this-about)
- [Who should use it?](#who-should-use-it)
- [Pre-requisites](#pre-requisites)
 - [Getting Ready to setup](#getting-ready)
 - [How to use it?](#how-to-use-it)
    - [Shell](#using-shell-aliases)
    - [VIM Aliases](#using-vim-aliases)
    - [TMux Aliases](#using-tmux-aliases)
- [Contributing](Contributing.md)
- [References](#references)
    - [Mac OS X](Mac-OS-X.md)
    - [Linux OS](#Linux-OS.md)

## What is this about?
This is a Git repository to help you setup your new workstation for commonly used tools and make changes to them as you move ahead, using the power of Git & GitHub. 

The current steps cover some well known OSes used for development and have been tested on
1. Mac OS X (**High Sierra: 10.13**)
2. Ubuntu (**Xenial Xerus: 16.04 LTS**)
3. CentOS 7 (**7.5-1804**)
4. Fedora Workstation **28**
but it should work seamlessly on any variants lower or higher than the above.

Please read the below instructions carefully to extract the best result from this repo.


## Who should use it?
Anyone who uses software such as a 
1. Shell such as **Bash**, **Zsh**
2. Terminal Multiplexer such as **Tmux**
3. Text Editor such as **VIM** on their local / remote machines.
4. A full fledged Code Editor like **Atom** in their daily development.


## Pre-Requisites
1. A shell such as Bash, Zsh or equivalent.
2. VIM Editor
3. Atom Editor
4. Tmux
5. SSH Keys
6. Git 
7. GitHub Access


## Getting Ready
1. If you use a Linux OS such as Ubuntu, Fedora, OpenSUSE or any similar ones OR Mac OS X or any of its variants, it will usually have a built-in shell with a terminal application to access it.
2. Obtaining VIM is as easy as mentioned in this **[website](https://www.sitepoint.com/getting-started-vim/)**
3. Tmux can be installed via this **[document](https://howchoo.com/g/ytkwotvkztq/using-the-iterm-2-and-tmux-integration)**.
4. You can follow the steps [**here**](https://www.ssh.com/ssh/keygen/) to generate SSH keys.
5. As per your OS (*Mac / Linux / Windows*), please follow these **[steps](https://linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)** to install Git.
6. Please add your SSH keys (*generated in step 4*) to GitHub via this **[page](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)**

## How to Use it?

1.  Navigate to **repo**
2.  On a terminal, clone this repo locally using 
  `git clone git@github.com:vinayhegde1990/initial-workstation-config.git`
3.  Change your directory to the downloaded repo
  `cd initial-workstation-config`


## Using Shell Aliases
1.  Copy all the files from the `.bash_profile .bashrc` in the downloaded git repo  to your home directory.
2.  Run the `source ~/.bash_profile && source ~/.bashrc` to get the Bash aliases in effect.
3.  Alternatively, you can also logout of all Shell sessions and re-login to achieve the same.


## Using Vim Aliases
1. Copy all the files from the `.vim/` in the downloaded git repo to your home directory.
2. If you already have a VIM process running, you can go into Escape mode by pressing `Esc`, type `:` and then write `source:~/.vim/.vimrc`
3. For a new VIM session, the changes will automatically apply themselves.

## Using Tmux Aliases
1. Copy all the files from the `.tmux/` in the downloaded git repo to your home directory.
2. If you already have a Tmux process running, you can go into Escape mode by pressing `Esc`, type `:` and then write `source-file :~/.tmux/tmux.conf`
3. For a new Tmux session, the changes will automatically apply themselves.

## References
All due credit to each of those individuals who maintain diverse open source tools without which building this project would have been impossible. For quick synopsis, they're classified into categories above. 
