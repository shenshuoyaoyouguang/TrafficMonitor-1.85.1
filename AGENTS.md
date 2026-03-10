# Repository Guidelines

## 项目结构与模块
- `TrafficMonitor/` 主程序（MFC C++），包含 UI、监控逻辑、资源 `res/`、皮肤 `skins/`、`tinyxml2/`。
- `OpenHardwareMonitorApi/` 硬件监控封装与 `LibreHardwareMonitorLib.dll`。
- `PluginDemo/` 插件示例工程。
- `include/` 对外接口与 `PluginInterface.h`。
- `Screenshots/`、`UpdateLog/` 为文档与发布素材。

## 构建、测试与本地运行
- Visual Studio 2022 + v143 工具集为主，打开 `TrafficMonitor.sln` 构建。
- 命令行示例：`msbuild TrafficMonitor.sln -p:Configuration=Release -p:Platform=x64 -p:PlatformToolset=v143`。
- Lite 版本示例：`msbuild TrafficMonitor.sln -p:Configuration="Release (lite)" -p:Platform=x64 -p:PlatformToolset=v143`。
- 产物通常在 `Bin/x64/Release/TrafficMonitor.exe`（x86 为 `Bin/Release`，ARM64EC 为 `Bin/ARM64EC/Release`）。

## 代码风格与命名
- 使用 4 空格缩进，花括号独占一行（Allman）。
- 类名以 `C` 开头（如 `CTaskBarDlg`），成员变量常用 `m_` 前缀。
- 头文件与实现文件成对维护，优先遵循同目录既有写法，避免大范围重排格式。

## 测试指南
- 仓库未发现自动化测试框架，请进行最小手工验证：
- 启动主窗口、任务栏嵌入、选项设置保存、生效、插件加载与卸载。
- 涉及硬件监控时，验证温度/占用率读取与异常提示。

## 提交与 PR
- 当前快照无 `.git` 历史，无法归纳既有提交规范；建议使用简洁前缀如 `feat:`、`fix:`、`refactor:`。
- PR 需包含变更目的、影响范围、验证步骤；UI 变更请附截图。
- 若修改插件接口或硬件监控逻辑，请在 PR 中说明兼容性影响。

## 安全与配置提示
- 标准版涉及硬件监控可能需要管理员权限；避免引入未审核的驱动/外部 DLL。
- 插件 DLL 放置在 `TrafficMonitor.exe` 同级的 `plugins/` 目录，更新接口需同步 `include/PluginInterface.h` 与 `PluginDemo/`。
