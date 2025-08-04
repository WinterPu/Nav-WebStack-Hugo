#!/bin/bash

# Hugo WebStack 本地启动脚本 (Mac/Linux)
# 作者: WebStack Hugo Theme
# 使用方法: ./start.sh

echo "正在启动 Hugo WebStack 导航网站..."
echo "================================================"

# 检查Hugo是否安装
if ! command -v hugo &> /dev/null; then
    echo "错误: Hugo 未安装或未添加到PATH中"
    echo "请先安装Hugo: https://gohugo.io/getting-started/installing/"
    exit 1
fi

# 显示Hugo版本
echo "Hugo 版本信息:"
hugo version
echo ""

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXAMPLE_SITE_DIR="$SCRIPT_DIR/exampleSite"

# 检查exampleSite目录是否存在
if [ ! -d "$EXAMPLE_SITE_DIR" ]; then
    echo "错误: exampleSite 目录不存在"
    echo "请确保在正确的项目目录中运行此脚本"
    exit 1
fi

# 切换到exampleSite目录并启动Hugo服务器
echo "切换到目录: $EXAMPLE_SITE_DIR"
cd "$EXAMPLE_SITE_DIR"

echo "启动Hugo开发服务器..."
echo "网站地址: http://localhost:1313/nav-webstack-hugo/"
echo "按 Ctrl+C 停止服务器"
echo "================================================"
echo ""

# 启动Hugo服务器
hugo server --themesDir ../.. --theme nav-webstack-hugo --bind 0.0.0.0 --baseURL http://localhost:1313/nav-webstack-hugo/
