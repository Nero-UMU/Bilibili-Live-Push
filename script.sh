#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
IFS=$'\n'

echo -e "\033[46;37m================================================\033[0m"
echo -e "\033[46;37m|              Author:NeroUMU                  |\033[0m"
echo -e "\033[46;37m|                                              |\033[0m"
echo -e "\033[46;37m|            Bilibili直播推流脚本              |\033[0m"
echo -e "\033[46;37m|         遇到Bug请自行解决(我也不会)          |\033[0m"
echo -e "\033[46;37m|                                              |\033[0m"
echo -e "\033[46;37m|        你在说什么,小猫咪听不懂啦.jpg         |\033[0m"
echo -e "\033[46;37m================================================\033[0m"

echo -e "\033[31m此脚本默认已经安装好了ffmpeg!没有安装的话请自行安装后再运行此脚本 \033[0m"
echo -e "\033[36m为确保程序正常运行,请在安装好tmux后,运行 tmux new -s streamVideo 命令后,运行本脚本!\033[0m"
echo -e "\033[36m正确开始推流后,按下快捷键Ctrl+b,d使tmux后台运行\033[0m"
echo -e "\033[36m如需停止推流,再次运行脚本,选择停止推流即可\033[0m"

stream_mp3_one_jpg() { # mp3音频+一张jpg资源类型
    read -p "请输入mp3音频目录的绝对路径:" mp3_path
    read -p "请输入jpg图片的绝对路径:" jpg_path
    read -p "是否需要添加说明的文字(yes/no):" wantText
    if [ $wantText = "yes" ]; then
        read -p "请输入使用的字体(绝对路径):" ttf
        read -p "请输入需要添加的说明文字:" text
        read -p "文字大小(默认10):" px
        read -p "文字颜色(默认white):" color
        read -p "请输入x坐标,相对于左上角(默认0):" x
        read -p "请输入y坐标,相对于左上角(默认0):" y
        if [ -z "${px}" ]; then
            px=10
        fi
        if [ -z "${color}" ]; then
            color="white"
        fi
        if [ -z "${x}" ]; then
            x=0
        fi
        if [ -z "${y}" ]; then
            y=0
        fi
        while true; do
            cd $mp3_path
            music=$(find ./ -name "*.mp3" | shuf -n 1)
            ffmpeg -re -loop 1 -i $jpg_path -i $music -shortest -vf drawtext=fontcolor=$color:fontsize=$px:fontfile=$ttf:text="$text":x=$x:y=$y -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
        done

    else
        while true; do
            cd $mp3_path
            music=$(find ./ -name "*.mp3" | shuf -n 1)
            ffmpeg -re -loop 1 -i $jpg_path -i $music -shortest -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
        done

    fi
}

stream_mp3_multi_jpg() { #mp3音频+多张jpg图片
    read -p "请输入mp3音频目录的绝对路径:" mp3_path
    read -p "请输入jpg图片目录的绝对路径:" jpg_path
    read -p "是否需要添加说明的文字(yes/no):" wantText
    if [ $wantText = "yes" ]; then
        read -p "请输入使用的字体(绝对路径):" ttf
        read -p "请输入需要添加的说明文字:" text
        read -p "文字大小(默认10):" px
        read -p "文字颜色(默认white):" color
        read -p "请输入x坐标,相对于左上角(默认0):" x
        read -p "请输入y坐标,相对于左上角(默认0):" y
        if [ -z "${px}" ]; then
            px=10
        fi
        if [ -z "${color}" ]; then
            color="white"
        fi
        if [ -z "${x}" ]; then
            x=0
        fi
        if [ -z "${y}" ]; then
            y=0
        fi
        while true; do
            cd $mp3_path
            music=$(find ./ -name "*.mp3" | shuf -n 1)
            jpg_name=$(echo $music | sed 's/mp3/jpg/g')
            image_path=$jpg_path"/"$jpg_name
            ffmpeg -re -loop 1 -i $image_path -i $music -shortest -vf drawtext=fontcolor=$color:fontsize=$px:fontfile=$ttf:text="$text":x=$x:y=$y -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
        done

    else
        while true; do
            cd $mp3_path
            music=$(find ./ -name "*.mp3" | shuf -n 1)
            jpg_name=$(echo $music | sed 's/mp3/jpg/g')
            image_path=$jpg_path"/"$jpg_name
            ffmpeg -re -loop 1 -i $image_path -i $music -shortest -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp

        done

    fi

}

stream_mp4() { #mp4视频资源
    read -p "请输入mp4视频目录的绝对路径:" mp4_path
    read -p "是否需要添加说明的文字(yes/no):" wantText
    if [ $wantText = "yes" ]; then
        read -p "请输入使用的字体(绝对路径):" ttf
        read -p "请输入需要添加的说明文字:" text
        read -p "文字大小(默认10):" px
        read -p "文字颜色(默认white):" color
        read -p "请输入x坐标,相对于左上角(默认0):" x
        read -p "请输入y坐标,相对于左上角(默认0):" y
        if [ -z "${px}" ]; then
            px=10
        fi
        if [ -z "${color}" ]; then
            color="white"
        fi
        if [ -z "${x}" ]; then
            x=0
        fi
        if [ -z "${y}" ]; then
            y=0
        fi

        while true; do
            cd $mp4_path
            music=$(find ./ -name "*.mp4" | shuf -n 1)
            ffmpeg -re -i $music -shortest -vf drawtext=fontcolor=$color:fontsize=$px:fontfile=$ttf:text="$text":x=$x:y=$y -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp

        done

    else
        while true; do
            cd $mp4_path
            music=$(find ./ -name "*.mp4" | shuf -n 1)
            ffmpeg -re -i $music -shortest -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
        done
    fi
}

stream_anime() {
    read -p "请输入番剧目录的绝对路径:" anime_path
    read -p "是否需要添加说明的文字(yes/no):" wantText
    if [ $wantText = "yes" ]; then
        read -p "请输入使用的字体(绝对路径):" ttf
        read -p "请输入需要添加的说明文字:" text
        read -p "文字大小(默认10):" px
        read -p "文字颜色(默认white):" color
        read -p "请输入x坐标,相对于左上角(默认0):" x
        read -p "请输入y坐标,相对于左上角(默认0):" y
        if [ -z "${px}" ]; then
            px=10
        fi
        if [ -z "${color}" ]; then
            color="white"
        fi
        if [ -z "${x}" ]; then
            x=0
        fi
        if [ -z "${y}" ]; then
            y=0
        fi
    fi
    read -p "是否添加字幕,字幕文件需和番剧文件在同一个目录下(yes/no):" sub
    if [ $sub='yes' ]; then
        while true; do
            cd $anime_path
            for video in $(ls *.mkv || ls *.mp4); do
                name=$(echo $video | sed -e 's/.mkv//g' -e 's/.mp4//g' -e 's/\[/\\\[/g' -e 's/\]/\\\]/g')
                sub_name=$name".ass"
                if [ -f "$sub_name" ]; then
                    if [ $wantText = "yes" ]; then
                        ffmpeg -re -i $video -shortest -vf subtitles=$sub_name,drawtext=fontcolor=$color:fontsize=$px:fontfile=$ttf:text="$text":x=$x:y=$y -preset ultrafast -c:v libx264 -g 60 -b:v 1000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
                    else
                        ffmpeg -re -i $video -shortest -vf subtitles=$sub_name -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
                    fi
                else
                    if [ $wantText = "yes" ]; then
                        ffmpeg -re -i $video -shortest -vf drawtext=fontcolor=$color:fontsize=$px:fontfile=$ttf:text="$text":x=$x:y=$y -preset ultrafast -c:v libx264 -g 60 -b:v 1000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
                    else
                        ffmpeg -re -i $video -shortest -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
                    fi
                fi
            done
        done
    else
        while true; do
            cd $anime_path
            for video in $(ls *.mkv || ls *.mp4); do
                if [ $wantText = "yes" ]; then
                    ffmpeg -re -i $video -vf drawtext=fontcolor=$color:fontsize=$px:fontfile=$ttf:text="$text":x=$x:y=$y -shortest -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
                else
                    ffmpeg -re -i $video -shortest -preset ultrafast -c:v libx264 -g 60 -b:v 3000k -c:a aac -b:a 128k -strict -2 -crf 30 -f flv $rtmp
                fi
            done
        done
    fi
}

set_rtmp() { #设置rtmp信息
    while true; do
        read -p "输入服务器地址+串流密钥,(格式 rtmp://XXX/?streamname=XXX):" rtmp
        if [[ $rtmp =~ "rtmp://" ]]; then
            echo -e "\033[43;37m 格式正确 \033[0m"
            break
        else
            echo -e "\033[41;37m 格式错误,请重新输入 \033[0m"
        fi
    done
}

stop_stream() {
    tmux kill-session -t streamVideo
    killall ffmpeg
}

start_stream() { #开始推流
    echo -e "\n推流资源类型:"
    echo "1---mp3音频+一张jpg图片"
    echo "2---mp3音频+多张jpg图片(图片名称需和音频名称相同,如1.mp3和1.jpg)"
    echo "3---mp4视频"
    echo "4---番剧"
    read -p "请选择推流的资源类型:" choose

    case "${choose}" in
    1)
        set_rtmp
        stream_mp3_one_jpg
        ;;
    2)
        set_rtmp
        stream_mp3_multi_jpg
        ;;
    3)
        set_rtmp
        stream_mp4
        ;;
    4)
        set_rtmp
        stream_anime
        ;;
    *)
        echo -e "\033[42;37m错误的选项!\033[0m"
        ;;
    esac

}

script_menu() {
    echo -e "\n1---开始推流"
    echo "2---停止推流"
    read -p "请选择开始还是结束:" choose
    case "${choose}" in
    1)
        start_stream
        ;;
    2)
        stop_stream
        ;;
    *)
        echo -e "\033[42;37m错误的选项!\033[0m"
        ;;
    esac

}

script_menu
