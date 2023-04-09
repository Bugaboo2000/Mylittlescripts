#!/bin/bash

Plugvim(){ 
#    if [which "plug.vim">/dev/null]
#    This is my original solution
#    Try to fix the condition with this alternative solution:
    if [-x "$(command -v plug.vim)"] ; then 
    sh -c 'curl -O\"${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim\" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    wait
    touch $HOME/.config/nvim/init.vim
    wait
    mkdir $HOME/.local/share/nvim/site/autoload/plugins/ 
    echo -e "source $HOME/.local/share/nvim/site/autoload/plug.vim\ncall plug#begin('$HOME/.local/share/nvim/site/autoload/plugins')\ncall plug#end()\n" >> $HOME/.config/nvim/init.vim
    wait
    dialog --title "Plugvim setup" --msgbox "Vim plug installed" 7 60
    wait
    exit 0

# Enabled else again. I'm editing this on Termux, and have a lot of incompatibilites
# running normal on my Desktop

else
 dialog --title "Plugvim setup" --msgbox "Vim plug already installed" 7 60
    fi 
}

Gitlink(){

# if [which "git">/dev/null]
# Alternative solution 2
 if [ -x "$(command -v git)"]; then 
    gitlink=$(dialog --title "Install a Plugin" --inputbox "Paste the github repository" 7 60 2>&1 >/dev/tty)
    cd $HOME/.local/share/nvim/site/autoload/plug.vim && git clone "$gitlink"
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
        1 'Enable number' \
        2 'Enable "cursorline' \
        3 'Enable syntax' \
        4 'Change colorscheme' \
        5 'Manual settings' \
        6 'Return' \
        7 'Exit' \
        2>&1 >/dev/tty
    }

    Colorschemes(){
    dialog --menu "Change colorscheme" 15 50 40 \
        1 'Blue' \
        2 'DarkBlue' \
        3 'Delek' \
        4 'Desert' \
        5 'Elflord' \
        6 'Evening' \
        7 'Habamax' \
        8 'Industry' \
        9 'Koehler' \
        10 'Lunaperche' \
        11 'Morning' \
        12 'Murphy' \
        13 'Pablo' \
        14 'Peachpuff' \
        15 'Quiet' \
        16 'Ron' \
        17 'Shine' \
        18 'Slate' \
        19 'Torte' \
        20 'Zellner' \
        21 'Default' \
        22 'Custom colorscheme' \
        23 'Exit' \
        2>&1 > /dev/tty 
}

# You need to put this conditions inside the variables
# This solution is dumb like the guy who's code this shittybox
# Maybe another time i'm gonna reintegrate the conditions inside the variables
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

while true;do 
	autoinstall=$(Essentials)
		case autoinstall in
1)  cd $HOME/.local/share}/nvim/site/autoload/plug.vim \
    git clone https://github.com/dense-analysis/ale.git;;
	2)cd $HOME/.local/share}/nvim/site/autoload/plug.vim \
    git clone https://github.com/tpope/vim-fugitive.git;;
	3)cd $HOME/.local/share}/nvim/site/autoload/plug.vim \
    git clone https://github.com/sheerun/vim-polyglot.git;;
	4) exit 0;;
esac
	done

    while true; do
        nvimsetup=$(Nvimconf)
        case nvimsetup in 
        1) echo "set number" >> $HOME/.config/nvim/init.vim;;
        2) echo "set cursorline" >> $HOME/.config/nvim/init.vim;;
        3) echo ":syntax enable" >> $HOME/.config/nvim/init.vim;;
        4) Colorschemes;;
        5) nvim $HOME/.config/nvim/init.vim;;
        6) MenuBox;;
        7) exit 0;;
esac
    done 

    while true; do
        colors=$(Colorschemes)
        case colors in 
            1) echo ":colorscheme blue" >> $HOME/.config/nvim/init.vim;;
            2) echo ":colorscheme darkblue" >> $HOME/.config/nvim/init.vim;;
            3)echo ":colorscheme delek" >> $HOME/.config/nvim/init.vim;;
            4)echo ":colorscheme desert" >> $HOME/.config/nvim/init.vim;;
            5)echo ":colorscheme elford" >> $HOME/.config/nvim/init.vim;;
            6)echo ":colorscheme evening" >> $HOME/.config/nvim/init.vim;;
            7)echo":colorscheme habamax" >> $HOME/.config/nvim/init.vim;;
            8)echo":colorscheme industry" >> $HOME/.config/nvim/init.vim;;
            9)echo ":colorscheme koehler" >> $HOME/.config/nvim/init.vim;;
            10)echo ":colorscheme lunaperche" >> $HOME/.config/nvim/init.vim;;
            11)echo ":colorscheme morning" >> $HOME/.config/nvim/init.vim;;
            12)echo ":colorscheme murphy" >> $HOME/.config/nvim/init.vim;;
            13)echo ":colorscheme pablo" >> $HOME/.config/nvim/init.vim;;
            14)echo":colorscheme peachpuff" >> $HOME/.config/nvim/init.vim;;
            15)echo":colorscheme quiet" >> $HOME/.config/nvim/init.vim;;
            16)echo":colorscheme ron" >> $HOME/.config/nvim/init.vim;;
            17)echo":colorscheme shine" >> $HOME/.config/nvim/init.vim;; 
            18)echo":colorscheme slate" >> $HOME/.config/nvim/init.vim;;
            19)echo":colorscheme torte" >> $HOME/.config/nvim/init.vim;;
            20)echo":colorscheme zellner" >> $HOME/.config/nvim/init.vim;;
            21)echo ":colorscheme default" >> $HOME/.config/nvim/init.vim;;
            22)dialog --title "Custom colorschmeme" --inputbox "Paste the Github repository" 7 6 0 2>&1 > /dev/tty ;;
            23)exit 0;;
esac
    done
