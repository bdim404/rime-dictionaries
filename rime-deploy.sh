#!/bin/bash

# 检查是否是 root 用户，如果是 root 用户则强制停止并给出提示
if [ "$(id -u)" -eq 0 ]; then
    echo "错误：请以普通用户身份执行此脚本！"
    exit 1
fi

# 更新软件包列表并安装 fcitx5 和相关插件
echo "正在安装 fcitx5 和相关插件..."
if ! sudo apt update && sudo apt install --install-recommends fcitx5 fcitx5-chinese-addons; then
    echo "安装 fcitx5 失败，请手动运行以下命令进行安装："
    echo "sudo apt update && sudo apt install --install-recommends fcitx5 fcitx5-chinese-addons"
    echo "fcitx5 安装并不影响字典下载，可在脚本完成后手动安装 fcitx5 和相关插件"
    
    # 提供继续执行的选择，默认选择继续
    read -p "是否继续执行后续步骤？[Y/n] " choice
    choice=${choice:-Y}

    if [[ "$choice" =~ ^[Nn]$ ]]; then
        echo "安装未完成，脚本退出。"
        exit 1
    fi
fi

# 安装 fcitx5-rime
echo "正在安装 fcitx5-rime..."
if ! sudo apt install fcitx5-rime; then
    echo "安装 fcitx5-rime 失败，请手动运行以下命令进行安装："
    echo "sudo apt install fcitx5-rime"
    
    # 提供继续执行的选择，默认选择继续
    read -p "是否继续执行后续步骤？[Y/n] " choice
    choice=${choice:-Y}

    if [[ "$choice" =~ ^[Nn]$ ]]; then
        echo "安装未完成，脚本退出。"
        exit 1
    fi
fi

# 创建目录并进入到 fcitx5 配置目录
echo "正在创建目录并进入 ~/.local/share/fcitx5..."
mkdir -p ~/.local/share/fcitx5/rime && cd ~/.local/share/fcitx5

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
