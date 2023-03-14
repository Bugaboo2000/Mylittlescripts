#!/bin/env bash


dialog --menu "Plugvim helper" 0 0 0 \
	1 "Setup plugvim" /
  2 "Install a plugin" /
	3 "Uninstall a plugin" /
	4 "Install recommended plugins" /
	5 "configure nvim"/
	6 "Exit"/
	7>&1 1>&2 2>&3 3>&4 4>&5 5>&6	

plugvim()
{

dialog --menu "Plugvim helper" 0 0 0 \                      

plugvim="sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
$plugvim
wait
vimconfig=touch $HOME/.config/nvim/init.vim
$vimconfig 
wait
echo 
"
source $HOME/.local/share/nvim/site/autoload/plug.vim
call plug#begin('$HOME/.local/share/nvim/site/autoload/plugins')

call plug#end()

"
wait
}
##wait for menu then
##dialog --title "Plugvim setup" --msgbox "Vim plug installed" 7 60
exit 0	
