#!/usr/bin/env bash

echo "\033[0;32m?\033[0m \033[36m请输入你的新发布的版本号(ex:1.0.0)：\033[0m"

read version

v='  "version": "'$version'",'

# 处理 package.json
sed -i -e "4s/^.*$/$v/" 'package.json'
if [ -f "package.json-e" ];then
  rm 'package.json-e'
fi
echo '版本号修改成功'

npm config get registry # 检查仓库镜像库

npm config set registry=http://registry.npmjs.org # 设置仓库镜像库: 淘宝镜像https://registry.npm.taobao.org

npm login # 登陆

npm publish # 发布

npm config set registry=https://registry.npm.taobao.org # 设置为淘宝镜像
