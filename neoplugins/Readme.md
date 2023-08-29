# About

This script is helpful to make neovim plugin setup and installation more easier with a interactive guided user interface. 

## Usage

### Setup git-svn and subversion:

Debian Derivates:
~~~
sudo apt install subversion git-svn git dialog curl-y
~~~

Fedora Derivates:
~~~
sudo dnf install subversion git-svn git dialog curl
~~~

Arch Linux Derivates:
~~~
sudo pacman -S subversion git dialog curl--noconfirm
~~~
### Download the script:

<!-- Work in progress, more detailed documentation and ilustrated images of usage soon !-->

~~~
curl -O https://raw.githubusercontent.com/Bugaboo2000/Mylittlescripts/main/neoplugins/neoplugins.sh
~~~

### Set executable permissions
~~~
chmod +x neoplugins.sh
~~~
### Run the script
~~~
./updater.sh
~~~
