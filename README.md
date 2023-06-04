# Bilibili-Live-Push

## B站直播推流
可以选择需要的推动模式后添加描述性的文字，比如版权信息或者门户网站什么的

# 使用方法
```
bash <(wget -qO- -o- https://raw.githubusercontent.com/Nero-UMU/Bilibili-Live-Push/main/script.sh) 
```

# 只支持如下三种模式
- mp3音频+一张jpg图片组合成视频推送
- mp3音频+对应的jpg图片组合成视频推送
- mp4视频推流

# 可能会遇到的问题
- 链接错误导致的推流失败
    - 有可能是链接中的 "&" 符号导致的错误，尝试使用 Bash 运行此脚本
- 读取目录错误
    - 有可能是文件中的空格导致的，不过理论上应该不会有这个问题