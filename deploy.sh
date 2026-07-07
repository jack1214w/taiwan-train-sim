#!/bin/bash
# ============================================================
# 臺鐵列車模擬駕駛 — 一鍵更新部署腳本
# 用法：在終端機輸入
#   ~/Desktop/CC工作區/Code專屬/taiwan-train-sim/deploy.sh
# 它會自動：
#   1. 複製最新的遊戲檔（台鐵列車模擬駕駛.html → index.html）
#   2. 提交（commit）
#   3. 推送（push）到 GitHub
#   4. GitHub Pages 約 1 分鐘後自動重新部署
# ============================================================
set -e
cd "$(dirname "$0")"
SRC="../台鐵列車模擬駕駛.html"

# 1) 複製最新遊戲檔
if [ -f "$SRC" ]; then
  cp "$SRC" index.html
  echo "✔ 已複製最新遊戲檔 → index.html"
else
  echo "⚠ 找不到 $SRC，跳過複製（直接部署現有內容）"
fi

# 2) 檢查是否有任何變更（含新增檔案）
if [ -z "$(git status --porcelain)" ]; then
  echo "沒有變更，線上版已是最新，不需要部署。"
  exit 0
fi

# 3) 提交並推送
git add -A
git commit -m "更新遊戲 $(date '+%Y-%m-%d %H:%M')"
git push

echo ""
echo "✅ 推送完成！GitHub Pages 約 1 分鐘後自動更新："
echo "   https://jack1214w.github.io/taiwan-train-sim/"
