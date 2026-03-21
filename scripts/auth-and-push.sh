#!/usr/bin/env bash
# 一次性：用 PAT 登录 gh，创建远程仓库（若不存在），并推送 main。
# 用法：在终端先 export GITHUB_TOKEN，再执行本脚本。
# 获取 Token：https://github.com/settings/tokens （需 repo 权限）

set -euo pipefail

source /etc/network_turbo 2>/dev/null || true

REPO_OWNER="${GITHUB_REPO_OWNER:-Tianxiao1201}"
REPO_NAME="${GITHUB_REPO_NAME:-omni-fake-project-page}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "错误：未设置 GITHUB_TOKEN。"
  echo "请在本机终端执行（将 ghp_xxx 换成你的 Personal Access Token）："
  echo "  export GITHUB_TOKEN='ghp_xxxxxxxxxxxxxxxxxxxx'"
  echo "  bash scripts/auth-and-push.sh"
  exit 1
fi

echo "$GITHUB_TOKEN" | gh auth login --with-token -h github.com

# 若远程已指向该仓库，优先尝试创建并推送；失败则仅推送
if gh repo view "${REPO_OWNER}/${REPO_NAME}" >/dev/null 2>&1; then
  echo "远程仓库已存在，直接推送..."
  git push -u origin main
else
  echo "创建远程仓库并推送..."
  gh repo create "${REPO_OWNER}/${REPO_NAME}" --public --source=. --remote=origin --push
fi

echo "完成。仓库：https://github.com/${REPO_OWNER}/${REPO_NAME}"
