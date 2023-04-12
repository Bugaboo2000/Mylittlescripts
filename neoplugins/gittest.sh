gitlink=$(dialog --title "Install a Plugin" --inputbox "Paste the github repository" 7 60 2>&1 >/dev/tty)
    cd $HOME/.local/share/nvim/site/autoload/plug.vim && git clone "$gitlink"
    

