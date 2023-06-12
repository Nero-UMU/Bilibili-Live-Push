# Bilibili-Live-Push

## B站直播推流
可以选择需要的推动模式后添加描述性的文字，比如版权信息或者门户网站什么的

# 使用方法
默认已经安装好了ffmpeg和tmux

## 开始推流
使用tmux创建一个窗口，名字为streamVideo
```
tmux new -s streamVideo
```

运行如下命令，按提示输入所需信息
```
bash <(wget -qO- -o- https://raw.githubusercontent.com/Nero-UMU/Bilibili-Live-Push/main/script.sh) 
```

设置好推流后使用 ``Ctrl+b``， ``d`` 快捷键使tmux后台运行

## 结束推流
再次运行脚本，选择结束推流即可

# 支持如下四种模式
- mp3音频+一张jpg图片组合成视频推送
- mp3音频+对应的jpg图片组合成视频推送
- mp4视频推流
- 番剧(mkv+ass)

# 可能会遇到的问题
- 链接错误导致的推流失败
    - 有可能是链接中的 "&" 符号导致的错误，尝试使用 Bash 运行此脚本
- 读取目录错误
    - 有可能是文件中的空格导致的，不过理论上应该不会有这个问题
