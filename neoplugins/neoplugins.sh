#!/bin/bash

Plugvim(){ 
    if [which "plug.vim">/dev/null]
    then
    sh -c 'curl -O\"${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim\" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    wait
    touch $HOME/.config/nvim/init.vim
    wait
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

if [which "git">/dev/null]
	then
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
            1) echo ":colorscheme blue";;
            2) echo ":colorscheme darkblue";;
            3)echo "";;
            4)echo "";;
            5)echo "";;
            6)echo "";;
            7)echo"";;
            8)echo"";;
            9)echo "";;
            10)echo "";;
            11)echo "";;
            12)echo "";;
            13)echo "";;
            14)echo"";;
            15)echo"";;
            16)echo"";;
            17)echo"";; 
            18)echo"";;
            19)echo"";;
            20)echo"";;
            21)echo "";;
            22)echo"";;
            23)exit 0;;
esac
    done
