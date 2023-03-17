#!/bin/bash

if which "git">/dev/null; then
    gitlink=$(dialog --title "Install a Plugin" --inputbox "Paste the github repository" 7 60 2>&1 >/dev/tty)
    git clone "$gitlink"
else
    dialog --title "Git not Found" --msgbox "Git is not installed, make sure to install git package." 7 60
fi

