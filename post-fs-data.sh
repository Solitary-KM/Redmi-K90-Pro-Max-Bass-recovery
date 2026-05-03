#!/system/bin/sh

MODDIR=${0%/*}

# 系统原文件路径
SRC_FILE="/odm/etc/audio/audio_lowpower_app_list.xml"
# 模块内自定义文件
CUSTOM_FILE="$MODDIR/files/lowpower_app_list.xml"

# 若两个文件都存在，则执行绑定替换
if [ -f "$SRC_FILE" ] && [ -f "$CUSTOM_FILE" ]; then
    mount --bind "$CUSTOM_FILE" "$SRC_FILE"
    # 可选：加固为只读，更稳定
    mount -o remount,ro "$SRC_FILE"
fi
