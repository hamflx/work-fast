# Work Fast - Nushell 配置

本仓库包含用于增强 Nushell 环境的配置文件，集成了 fnm（Fast Node Manager，快速 Node 版本管理器）和 zoxide（智能 cd 命令）。

## 快速安装

### 一键安装（适用于 CMD 或 PowerShell）

```powershell
powershell -c "iwr -useb https://gitlab.vmic.xyz/hamflx/work-fast/-/raw/main/configure.ps1 | iex"
```

### 手动安装

1. 下载脚本：

   ```powershell
   curl -o setup.ps1 https://gitlab.vmic.xyz/hamflx/work-fast/-/raw/main/configure.ps1
   ```

2. 运行脚本：

   ```powershell
   .\setup.ps1
   ```

## 功能介绍

- 将 fnm 和 zoxide 的配置文件下载到您的用户目录
- 更新 Nushell 配置（避免重复添加）
- 设置智能 Node.js 版本切换和目录导航功能

## 系统要求

- Windows 操作系统
- PowerShell
- Nushell（如果取消脚本中相关行的注释，脚本可以帮您安装）

## 常见问题

- 确认 Nushell 配置文件存在于 `%APPDATA%\nushell\config.nu` 和 `%APPDATA%\nushell\env.nu`
- 如果配置文件不存在，请先运行一次 Nushell 以生成配置文件

## 许可证

[MIT 许可证](LICENSE)
