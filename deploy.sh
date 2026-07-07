#!/bin/bash
# 一鍵更新部署：把最新的遊戲檔複製進來、commit、push
# 用法：./deploy.sh  （或給我一句「幫我更新部署」）
set -e
cd "$(dirname "$0")"
SRC="../台鐵列車模擬駕駛.html"

if [ -f "$SRC" ]; then
  cp "$SRC" index.html
  echo "已複製最新遊戲檔 → index.html"
fi

if git diff --quiet index.html README.md 2>/dev/null; then
  echo "沒有變更，不需要部署。"
  exit 0
fi

git add -A
git commit -m "更新遊戲 $(date '+%Y-%m-%d %H:%M')"
git push
echo ""
echo "✅ 已推送！GitHub Pages 約 1 分鐘後自動更新："
echo "   https://jack1214w.github.io/taiwan-train-sim/"
