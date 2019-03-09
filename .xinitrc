export MOZ_USE_XINPUT2=1
#export GDK_SCALE=3
#export GDK_DPI_SCALE=0.5

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xset r rate 200 30

~/.fehbg &
i3
