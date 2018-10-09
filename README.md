Initial Workstation Config
======================

## Table of Contents
- [What is this about?](#what-is-this-about)
- [Who should use it?](#who-should-use-it)
- [Pre-requisites](#pre-requisites)
 - [Setup the above pre-requisites](#getting-ready)
 - [How to use it?](#how-to-use-it)
    - [Shell](#using-shell-aliases)
    - [VIM Aliases](#using-vim-aliases)
    - [TMux Aliases](#using-tmux-shortcuts)
- [Tips](#tips)
- [Limitations](#limitations)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)
- [References](#references)
    - [Markdown Table of Contents Generators](#markdown-table-of-contents-generators)
    - [Recommended plugins for use with MarkdownTOC](#recommended-plugins-for-use-with-markdowntoc)

## What is this about?
This is a Git repository to help you setup your new workstation for commonly used tools and make changes to them as you move ahead, using the power of Git & GitHub.

Please read the below instructions carefully to maximize the tools in here.


## Who should use it?
Anyone who uses software such as a **Shell**, a **Terminal Multiplexer** and an **Editor** in their daily development.


## Pre-Requisites
1. A shell such as Bash, Zsh, Ksh or equivalent.
2. The VIM Editor
3. Tmux
4. SSH Keys
5. Git 
6. GitHub Access


## Getting Ready
1. If you use a Unix OS such as Ubuntu, Fedora, OpenSUSE, Mac OS X or any of its variants, it will usually have a default shell built-in.
2. Obtaining VIM is as easy as mentioned in this **[website](https://www.sitepoint.com/getting-started-vim/)**
3. Tmux can be installed via the document on **[this](https://howchoo.com/g/ytkwotvkztq/using-the-iterm-2-and-tmux-integration)**.
4. You can follow the steps [**here**](https://www.ssh.com/ssh/keygen/) to generate SSH keys.
5. As per your OS (*Mac / Linux / Windows*), please follow the required steps to install Git [**here**](https://linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)
6. Please add your SSH keys (*generated in step 4*) to GitHub following this **[page](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)**


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

## Using Tmux Shortcuts
1. Copy all the files from the `.tmux/` in the downloaded git repo to your home directory.
2. If you already have a Tmux process running, you can go into Escape mode by pressing `Esc`, type `:` and then write `source-file :~/.tmux/tmux.conf`
3. For a new Tmux session, the changes will automatically apply themselves.