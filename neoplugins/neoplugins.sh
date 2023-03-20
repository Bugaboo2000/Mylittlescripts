#!/bin/bash

Plugvim() {

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


MenuBox() {
    dialog --menu "Plugvim helper" 15 50 40 \
    1 "Setup plugvim" \
    2 "Install a plugin" \
    3 "Uninstall a plugin" \
    4 "Install recommended plugins" \
    5 "Configure nvim" \
    6 "Exit" \
    2>&1 >/dev/tty
}
$MenuBox
# echo "$(MenuBox)"
wait

SelectionInput

while true; do
    MenuChoice=$(MenuBox)
    case $MenuChoice in
        1) Plugvim;;
        2) Gitlink;;
        3) echo "Uninstall a plugin";;
        4) echo "Install recommended plugins";;
        5) echo "Configure nvim";;
        6) exit 0;;
    esac
done


