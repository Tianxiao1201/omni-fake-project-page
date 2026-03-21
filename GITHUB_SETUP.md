# omni-fake-project-page — 仓库与 GitHub Pages

本目录由 [eliahuhorwitz/Academic-project-page-template](https://github.com/eliahuhorwitz/Academic-project-page-template) 克隆而来，仅作论文展示用（无研究代码）。

**维护者 GitHub**：[@Tianxiao1201](https://github.com/Tianxiao1201)

## 登录 GitHub 并创建/推送（本机一条命令）

Agent 或 CI **无法代替你登录**：必须在终端里使用 [Personal Access Token](https://github.com/settings/tokens)（至少勾选 **repo**；classic token 即可）。

在本机项目根目录执行：

```bash
export GITHUB_TOKEN='ghp_你的令牌'
bash scripts/auth-and-push.sh
```

脚本会：`gh auth login --with-token` → 若远程尚无仓库则 `gh repo create … --push`，否则直接 `git push -u origin main`。

**请勿**把 Token 提交进仓库或发在聊天里；用一次可 `unset GITHUB_TOKEN`。

---

## 若你尚未在 GitHub 上创建仓库

1. 打开模板：<https://github.com/eliahuhorwitz/Academic-project-page-template>  
2. 点击 **Use this template** → **Create a new repository**  
3. Repository name 填 **`omni-fake-project-page`**，可见性任选，创建。

若你已用本机目录开发、想覆盖空仓库：

```bash
cd /path/to/omni-fake-project-page
git remote set-url origin https://github.com/Tianxiao1201/omni-fake-project-page.git
git branch -M main
git push -u origin main
```

（首次推送前需在 GitHub 上存在同名仓库，并完成登录 / SSH 或 HTTPS 凭据。）

## GitHub Pages

1. 仓库 **Settings** → **Pages**  
2. **Build and deployment** → Source：**Deploy from a branch**  
3. Branch：**main** / **(root)**（本模板为根目录 `index.html`，根目录即可）  
4. 保存后站点一般为：`https://tianxiao1201.github.io/omni-fake-project-page/`

仓库根目录已有 `.nojekyll`，可直接托管静态文件。

## 本地修改入口

- 主内容：`index.html`（按文件内 TODO 注释替换）  
- 静态资源：`static/`  
- 替换 favicon：`static/images/favicon.ico`  
- 社交预览图：`static/images/social_preview.png`（建议 1200×630）
