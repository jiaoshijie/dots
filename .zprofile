export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

startup_startx=`ps -ef | grep startx$ | wc -l`
if [ 0 -eq $startup_startx ]
then
    exec startx 2> "/tmp/jiaoshijie_startup_startx.log"
fi

