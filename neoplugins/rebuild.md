#!/bin/bash

Plugvim() { 
    if [ -x "$(command -v plug.vim)" ]; then
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        wait
        touch "$HOME/.config/nvim/init.vim"
        wait
        echo -e "source $HOME/.local/share/nvim/site/autoload/plug.vim\ncall plug#begin('$HOME/.local/share/nvim/site/autoload/plugins')\ncall plug#end()\n" >> "$HOME/.config/nvim/init.vim"
        wait
        dialog --title "Plugvim setup" --msgbox "Vim plug installed" 7 60
        wait
        exit 0
    else
        dialog --title "Plugvim setup" --msgbox "Vim plug already installed" 7 60
    fi
}

Gitlink() {
    if [ -x "$(command -v git)" ]; then
        gitlink=$(dialog --title "Install a Plugin" --inputbox "Paste the github repository" 7 60 2>&1 >/dev/tty)
        cd "$HOME/.local/share/nvim/site/autoload/plug.vim" && git clone "$gitlink"
        wait
        exit 0
    else
        dialog --title "Git not Found" --msgbox "Git is not installed, make sure to install git package." 7 60
    fi
}

Plugdel() {
    choice=$(dialog --title "Choose a plugin to Uninstall" --output-fd 1 --dselect "$HOME/.local/share/nvim/site/autoload/plugins/" 7 60)
    wait
    rm -rf "$choice"
}

Essentials() {
    while true; do
        autoinstall=$(dialog --menu 'Recomended plugins' 15 50 40 \
        1 'Ale debugger' \
        2 'fugitive git integration' \
        3 'vim polyglot' \
        4 'Exit' \
        2>&1 >/dev/tty)

        case $autoinstall in
            1)
                cd "$HOME/.local/share/nvim/site/autoload/plug.vim"
                git clone https://github.com/dense-analysis/ale.git
                ;;
            2)
                cd "$HOME/.local/share/nvim/site/autoload/plug.vim"
                git clone https://github.com/tpope/vim-fugitive.git
                ;;
            3)
                cd "$HOME/.local/share/nvim/site/autoload/plug.vim"
                git clone https://github.com/sheerun/vim-polyglot.git
                ;;
            4)
                break
                ;;
        esac
    done
}

Nvimconf() {
    while true; do
        nvimsetup=$(dialog --menu "Nvim settings" 15 50 40 \
        1 'Enable number' \
        2 'Enable "cursorline"' \
        3 'Enable syntax' \
        4 'Change colorscheme' \
        5 'Manual settings' \
        6 'Return' \
        7 'Exit' \
        2>&1 >/dev/tty)

        case $nvimsetup in 
            1)
                echo "set number" >> "$HOME/.config/nvim/init.vim"
                ;;
            2)
                echo "set cursorline" >> "$HOME/.config/n

