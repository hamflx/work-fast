# Work Fast - Nushell 配置

本仓库包含用于增强 Nushell 环境的配置文件，集成了 fnm（Fast Node Manager，快速 Node 版本管理器）和 zoxide（智能 cd 命令）。

## 前置条件

请先安装以下必要工具：

```powershell
winget install Microsoft.WindowsTerminal
winget install Schniz.fnm
winget install ajeetdsouza.zoxide
winget install nushell
```

## 快速安装

### 一键安装（适用于 CMD 或 PowerShell）

```powershell
powershell -c "iwr -useb https://github.com/hamflx/work-fast/raw/main/configure.ps1 | iex"
```

### 手动安装

1. 下载脚本：

   ```powershell
   curl -o setup.ps1 https://github.com/hamflx/work-fast/raw/main/configure.ps1
   ```

2. 运行脚本：

   ```powershell
   .\setup.ps1
   ```

## 常用快捷键

### Windows Terminal 快捷键

#### 标签页操作

- `Ctrl + Shift + T` - 新建标签页
- `Ctrl + Shift + W` - 关闭当前标签页
- `Ctrl + Tab` - 切换到下一个标签页
- `Ctrl + Shift + Tab` - 切换到上一个标签页

#### 窗口分割

- `Alt + Shift + -` - 水平分割面板
- `Alt + Shift + +` - 垂直分割面板
- `Alt + 方向键` - 在面板之间切换焦点
- `Alt + Shift + 方向键` - 调整当前面板大小
- `Ctrl + Shift + W` - 关闭当前面板

#### 其他操作

- `Ctrl + Shift + F` - 查找文本
- `Ctrl + Shift + Space` - 打开下拉菜单
- `Alt + Enter` - 切换全屏
- `Ctrl + Shift + C` - 复制
- `Ctrl + Shift + V` - 粘贴

### Nushell 快捷键

#### 命令行编辑

- `Ctrl + A` - 移动到行首
- `Ctrl + E` - 移动到行尾
- `Ctrl + U` - 清除当前行
- `Ctrl + L` - 清屏
- `Ctrl + R` - 搜索命令历史
- `Ctrl + W` - 删除前一个单词
- `Alt + B` - 向后移动一个单词
- `Alt + F` - 向前移动一个单词

#### 目录导航 (zoxide)

- `z 关键词` - 快速跳转到匹配的目录
- `zi` - 交互式选择并跳转到目录

#### Node.js 版本管理 (fnm)

- `fnm list` - 列出已安装的 Node.js 版本
- `fnm use` - 切换 Node.js 版本（会自动读取 .nvmrc 或 .node-version 文件）
- `fnm install` - 安装指定版本的 Node.js

## 功能介绍

- 将 fnm 和 zoxide 的配置文件下载到您的用户目录
- 更新 Nushell 配置（避免重复添加）
- 设置智能 Node.js 版本切换和目录导航功能

## 系统要求

- Windows 操作系统
- PowerShell
- Nushell、fnm 和 zoxide（请使用上述命令安装）

## 常见问题

- 确认 Nushell 配置文件存在于 `%APPDATA%\nushell\config.nu` 和 `%APPDATA%\nushell\env.nu`
- 如果配置文件不存在，请先运行一次 Nushell 以生成配置文件

## 许可证

[MIT 许可证](LICENSE)
