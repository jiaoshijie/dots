# export XMODIFIERS=@im=fcitx
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx

startup_startx=`ps -ef | grep startx$ | wc -l`
if [ 0 -eq $startup_startx ]
then
  source ~/.zshrc
  # 将错误信息打印到指定文件
  # exec startx 2> "/tmp/jiaoshijie_startup_startx.log"
  exec startx > /dev/null 2>&1
fi

