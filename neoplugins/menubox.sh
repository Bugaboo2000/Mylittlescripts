Menu() {
menubox=$(dialog --menu 'Plugvim helper' 15 50 40 \
1 'Setup plugvim' \
2 'Install a plugin' \
3 'Uninstall a plugin' \
4 'Install recommended plugins' \
5 'Configure nvim' \
6 'Exit' \
2>&1 >/dev/tty)

case $menubox in

1)echo '$Plugvim';;
2)echo '$PlugInstall';;
3)echo '$Plugdel';;
4)echo '$Nvimconfig';;
5) nvim $HOME/.config/nvim/init.vim;;
6) exit 0
}
