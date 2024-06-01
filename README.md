# Temp code

这个地方主要用于存放临时的代码片段。

## 文件结构

- **WindowsBat**
  - Adb_connect
  - Change_cmd

## Adb connect

### 准备工作

- adb 工具包
- 运行 Windows 的电脑

### 使用方法

首次使用前，请修改批处理文件中的 IP 地址，因为你的 IP 不可能与我的相同。然后双击打开文件，输入你的端口号即可连接你的手机，从而在电脑上进行无线调试。

## 结语

每次手动输入 `adb connect ip:port` 都感觉很麻烦，但是考虑到这只是一个 DOS 命令，而我最近也自学了一下 DOS 命令的写法，于是就诞生了这个脚本。

## Change cmd

### 准备工作

- 一台装有 Windows 10 或 Windows 11 的电脑

### 使用方法

以管理员权限运行 `change_cmd.bat`。如果你想用 PowerShell 替代 cmd，选择 1 即可完成。如果你希望恢复原本的 cmd，则重新运行 `change_cmd.bat` 并输入 2 即可。

### 原理

在注册表 `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\` 下新增一个 `cmd.exe`。虽然在 `C:\Windows\System32\` 也有一个 `cmd.exe`，但显然注册表的优先级更高，而且在注册表中本来也不存在 `cmd.exe` 这个键，所以我直接新增了一个 `cmd.exe`。想要修改回去时，只需在注册表中删除 `cmd.exe` 这个键即可。

## 结语

最近我使用了 Oh_my_zsh 来修改了 Poweshell，但已经习惯了在运行框中输入 `cmd` 来启动终端。因此，我希望在运行窗口中输入 `cmd` 时不会打开原本的老旧 cmd 终端，而是我已经修改过的 Powershell。主要是因为我使用 WSl(Linux的Windows子系统)的频率较高，于是就有了这个脚本的诞生。