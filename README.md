# 价保助手

一个桌面小工具，自动给京东和淘宝订单申请价格保护。登录一次，之后定时在后台运行，有退款时发送系统通知。

支持同一平台添加多个账号，方便给家人账号一起做价保。

![screenshot](screenshot.png)

## 功能

- 支持京东、淘宝双平台价格保护
- 同一平台可添加多个账号，独立管理
- 定时自动执行「一键价保」，间隔可配置为 30 分钟到 24 小时
- 统计每次退款金额、累计省钱和成功件数
- 每个账号可查看最近 30 天退款历史，并用折线图展示每日金额
- 价保成功时发送系统通知
- 关闭窗口后继续在后台运行：macOS 使用菜单栏，Windows 使用系统托盘
- 从 GitHub Releases 自动检查并安装更新

## 安装

发布包在 **[Releases](https://github.com/1441958695sz-altalex/code_text/releases)**：选择最新版本，在页面下方 **Assets** 中下载对应系统的文件即可。

### Windows

下载最新 Windows 安装包（文件名大致如下）：

- `auto-price-guard-版本号-win-x64-nsis.exe`：安装版，推荐日常使用
- `auto-price-guard-版本号-win-x64-portable.exe`：便携版，无需安装，适合临时使用

首次打开后按提示登录京东/淘宝账号即可。关闭主窗口后，程序会停留在系统托盘继续按计划运行。

### macOS

在同一 [Releases](https://github.com/1441958695sz-altalex/code_text/releases) 页面下载最新 `.dmg`（或 `.zip`），拖进 `/Applications`，首次打开后扫码登录即可。

> 建议在平时经常登录京东/淘宝的设备上安装。陌生环境登录容易触发风控，验证码会比较难过。

## 开发

```bash
pnpm install
pnpm start
```

## 打包

```bash
pnpm build:win
pnpm build:mac
```

Windows 会生成安装版和便携版；macOS 会生成 DMG 和 ZIP。

## 发布新版本（维护者）

1. 修改 `package.json` 里的 `version`（例如 `1.2.2`）。
2. 提交并推送后打标签（标签需带 `v` 前缀，且与版本号对应）：

   ```bash
   git add package.json
   git commit -m "chore: bump version to 1.2.2"
   git push origin master
   git tag v1.2.2
   git push origin v1.2.2
   ```

3. 在仓库 **Actions** 里可看到 **Release (Windows + macOS)** 工作流；完成后到 **Releases** 页面即可看到 Windows（`.exe`）与 macOS（`.dmg` / `.zip`）等文件供用户下载。

在 **Actions** 里手动运行同一工作流（`workflow_dispatch`）只会构建并上传构建产物到该次运行，**不会**创建 Release；创建带安装包的 Release 请使用上述打标签方式。

若需在 macOS 安装包上做 Apple 公证，请在仓库 **Settings → Secrets and variables → Actions** 中配置 `APPLE_ID`、`APPLE_APP_SPECIFIC_PASSWORD`、`APPLE_TEAM_ID`；未配置时 CI 会跳过公证，仍可正常产出 dmg。
