# Initial Workstation Config

> **Note**:
> _Please read the below instructions carefully to extract the best result from this repo._

## Table of Contents

- [What is this about?](#what-is-this-about)
- [Pre-requisites](#pre-requisites)
- [Getting Ready](#getting-ready)
- [How to Setup?](#how-to-setup)
  - [VIM Aliases](#using-vim-aliases)
  - [TMux Aliases](#using-tmux-aliases)
- [Contributing](Contributing.md)
- [References](#references)
  - [Linux OS](Linux-OS.md)
  - [Windows OS](Windows-OS.md)

## What is this about?

This is a Git repository to help you setup your new workstation for commonly used tools and make changes to them as you move ahead, using the power of Git & GitHub.

The current steps cover some well known OSes used for development and have been tested on

1. Mac OS X (**Monterey: 12.3.1**)
1. Ubuntu (**Focal Fossa: 20.04 LTS**)
1. CentOS 7 (**7.5-1804**)
1. Fedora Workstation **28**
but it should work seamlessly on any variants lower or higher than the above.

## Pre-Requisites

1. A computer with Linux OS like Ubuntu, Fedora, CentOS **or** UNIX OS like Mac OS X **or** Windows.
1. Depending on the above, a shell like Bash, Zsh on Linux/UNIX based OS or PowerShell on Windows
1. A text editor like [Vim](https://www.vim.org/) to modify the files from this repo _(We will install IDE such as [VSCode](https://code.visualstudio.com/) and terminal applications [iTerm2](https://iterm2.com/) **or** [Tabby](https://tabby.sh/) shortly after)._
1. SSH | GPG Keys
1. Git and access to this GitHub repo
1. Based on your OS, a package manager such as `apt-get`, `yum` for Linux OS, `brew` for Mac OS X or `chocolatey` for Windows.
1. Tmux

## Getting Ready

As per your OS (_Mac / Linux / Windows_), its associated shell and terminal:

1. Obtaining VIM is as easy as mentioned in this **[website](https://www.sitepoint.com/getting-started-vim/)**
1. You can **[generate SSH keys](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54)** and similarly **[create GPG keys](https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff/)**.
1. Please follow these **[steps](https://linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)** to install Git.
1. Then, **[add SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)** and **[GPG keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)** to Github
1. For Package Manager installation, follow these steps
   - Linux &rarr; **[apt-get](https://help.ubuntu.com/community/AptGet/Howto)** or **[yum](https://www.redhat.com/sysadmin/how-manage-packages)**
   - Mac OS X &rarr; **[brew](https://brew.sh/)**
   - Windows &rarr; **[choco](https://docs.chocolatey.org/en-us/choco/setup#installing-chocolatey)**
1. Finally, Tmux can be installed via this **[document](https://howchoo.com/g/ytkwotvkztq/using-the-iterm-2-and-tmux-integration)**.

## How to Setup?

1. From the native terminal app of your OS,
   - Linux &rarr; Install **[Terminal](https://manpages.ubuntu.com/manpages/lunar/en/man1/gnome-terminal.1.html)** via `apt-get install gnome-terminal`
   - Mac OS X &rarr; Install **[iTerm2](https://iterm2.com/)** via `brew install iterm2`
   - Windows &rarr; Install **[Tabby](https://tabby.sh/)** via `choco install tabby`
1. Then on the respective terminals, clone this repo locally using
  `git clone git@github.com:vinayhegde1990/initial-workstation-config.git`
1. Change your directory to the downloaded repo
  `cd initial-workstation-config`
1. Copy all the files from the `aliases` directory, `.bash_profile`, `.bashrc` in the downloaded git repo to your home directory.
1. Run the `source ~/.bash_profile && source ~/.bashrc` to get the Bash aliases in effect.
1. Alternatively, you can also close all Shell sessions and restart them to achieve the same.

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
