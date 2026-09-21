## v2.5.8

### ⚠️ 主要差异

- 后续不再提供以下发行版本：
  - 移除 macOS / Linux 发行版本
  - 移除 Windows `arm64` 版本
  - 移除 Windows 的内置 WebView2 版本
  - 移除 Windows 便携版
- 升级 Mihomo 内核构建版本，在 Windows `amd64` 架构上使用 `amd64-v3`
- 按照 Semantic Versioning 要求规范版本号
  - 版本号格式切换为 `x.y.z-daily.date+commit` ，用于和上游作区分
- 引入「树外补丁」，避免相关更改产生新 Commit 值干扰版本号生成过程
  - 切换 Tauri 签名密钥

### ℹ️ 上游更新

<details>
<summary><strong> 🐞 修复问题 </strong></summary>

- 修复从开始菜单再次打开应用后，窗口反复弹出并提示启动失败的问题
- 修复多个代理集合包含同名节点时，代理组中的节点变灰并显示 ambiguous、无法选择的问题

**🖥️ Windows**

- 修复 Windows 升级后因文件权限异常无法启动、需要手动清理配置的问题
- 修复 Windows 服务启动类型被改为手动后，软件启动卡住约两分钟的问题，并提供一键修复

</details>

<details>
<summary><strong> ✨ 新增功能 </strong></summary>


</details>

<details>
<summary><strong> 🚀 优化改进 </strong></summary>

- 优化侧边栏流量图表的 CPU 占用

**🖥️ Windows**

- 优化 Windows 服务安全检查未通过时的提示：启动、安装或修复服务时说明原因与内核占用，并提供处理方法

</details>
