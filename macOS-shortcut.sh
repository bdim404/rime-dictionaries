#!/bin/bash

# 获取当前日期（格式为 yyyyMMdd）
DATE=$(date +%Y%m%d)

# 构建 GitHub Release 下载链接
URL="https://api.bdim.moe/magic/https://github.com/bdim404/rime-dictionaries/releases/download/release-${DATE}/rime-dictionaries.tar.gz"

# 使用 curl 下载最新的 rime-dictionaries 文件
echo "正在下载 rime-dictionaries 文件..."
curl -L "$URL" -o rime-dictionaries.tar.gz

# 解压缩下载的 tar.gz 文件到 Rime 目录
echo "正在解压文件到 Rime 目录..."
tar -zxvf rime-dictionaries.tar.gz -C /Users/bdim404/Library/Rime

# 清理下载的 tar.gz 文件
rm rime-dictionaries.tar.gz
