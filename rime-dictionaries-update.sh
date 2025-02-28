#!/bin/bash

cd ~/.local/share/fcitx5

# 获取当前日期（格式为 yyyyMMdd）
DATE=$(date +%Y%m%d)

# 构建 GitHub Release 下载链接
URL="https://api.bdim.moe/magic/https://github.com/bdim404/rime-dictionaries/releases/download/release-${DATE}/rime-dictionaries.tar.gz"

# 使用 wget 下载最新的 rime-dictionaries 文件
echo "正在下载 rime-dictionaries 文件..."
wget -q --show-progress "$URL" -O rime-dictionaries.tar.gz

# 解压缩下载的 tar.gz 文件到 rime 目录
echo "正在解压文件到 rime 目录..."
tar -zxvf rime-dictionaries.tar.gz -C ~/.local/share/fcitx5/rime

# 清理下载的 tar.gz 文件
rm rime-dictionaries.tar.gz

echo "安装和配置完成。"
