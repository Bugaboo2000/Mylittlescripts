#!/bin/bash

Plugvim(){ 
    if which "plug.vim">/dev/null; then
    plugvim="sh -c 'curl -O\"${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim\" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
    $plugvim
    wait
    vimconfig=$(touch $HOME/.config/nvim/init.vim)
    $vimconfig
    wait
    echo -e "source $HOME/.local/share/nvim/site/autoload/plug.vim\ncall plug#begin('$HOME/.local/share/nvim/site/autoload/plugins')\ncall plug#end()\n" >> $HOME/.config/nvim/init.vim
    wait
    dialog --title "Plugvim setup" --msgbox "Vim plug installed" 7 60
    wait
    exit 0
else
    dialog --title "Plugvim setup" --msgbox "Vim plug already installed" 7 60
    fi 
}

Gitlink(){

if which "git">/dev/null; then
    gitlink=$(dialog --title "Install a Plugin" --inputbox "Paste the github repository" 7 60 2>&1 >/dev/tty)
    git clone "$gitlink"
    wait
    exit 0

else
    dialog --title "Git not Found" --msgbox "Git is not installed, make sure to install git package." 7 60
fi


}

Plugdel(){
        choice=$(dialog --title "Choose a plugin to Uninstall" --output-fd 1 --dselect $HOME/.local/share/nvim/site/autoload/plugins/ 7 60)
        wait
        rm -rf "$choice"

                }

Essentials(){
    dialog --menu 'Recomended plugins' 15 50 40 \
    1 'Ale debugger' \
    2 'fugitive git integration' \
    3 'vim polyglot' \
    4 'Exit' \
    2>&1 >/dev/tty 

}
MenuBox(){
    dialog --menu 'Plugvim helper' 15 50 40 \
    1 'Setup plugvim' \
    2 'Install a plugin' \
    3 'Uninstall a plugin' \
    4 'Install recommended plugins' \
    5 'Configure nvim' \
    6 'Exit' \
    2>&1 >/dev/tty

}

Nvimconf(){
    dialog --menu "Nvim settings" 15 50 40 \
        1 'Enable numbers' \
        2 'Enable "cursorline' \
        3 'Enable syntax' \
        4 'Change colorscheme' \
        5 'Manual settings' \
        6 'Return' \
        7 'Exit' \
        2>&1 >/dev/tty
    }



while true; do
    MenuChoice=$(MenuBox)
    case $MenuChoice in
        1) Plugvim;;
        2) Gitlink;;
        3) Plugdel;;
        4) Essentials;;
        5) Nvimconf;;
        6) exit 0;;
    esac
done 

    while true; do
        nvimsetup=$(Nvimconf)
        case nvimsetup in 
        1) echo "set numbers" >> $HOME/.config/nvim/init.vim;;
        2) echo "set cursorline" >> $HOME/.config/nvim/init.vim;;
        3) echo ":syntax enable" >> $HOME/.config/nvim/init.vim;;
        4) dialog --title "Colorscheme setup" --msgbox "Not implemented yet" 7 60;;
        5) nvim $HOME/.config/nvim/init.vim;;
        6) MenuBox;;
        7) exit 0;;
    esac
        done 
