## Play Rotor(Geometric Algebra)

> as an supplement for https://marctenbosch.com/quaternions/ .

### Workflow

使用者影响：CLI / `@calcit/procs` 配对正式 **0.41.0**，需要重新安装依赖并生成 JS。
四个点、两个拖动控制点、反射公式、向量名义身份和 `hud!` 页面报错保持。

根依赖配对 Memof 0.0.47、Geometric 0.0.19、Quaternion 0.2.23、JS FFI 0.2.13
和 Lagopus 0.5.17。折线写入接收具名顶点与 Lagopus 分段标记的 `PolylineItem` union，
保留原顶点次序和分段位置。相关写入合同见 [Lagopus #41](https://github.com/WebGPU-Art/lagopus/pull/41)。

原 0.31 迁移中的 `defref`、坐标 List 与两类 V3 的受检转换、-9…9 网格顺序保持。
不改变 Store/Op、几何算法、CDN 与服务器部署目录。npm 新解析候选版本包龄按本轮约定
设为 60 分钟，无例外；正常复用 lock 不重新等待，lock 仅更新 procs。
原 CI 门禁保持，多命令步骤显式遇错退出，移除额外全局安装脚本启用；
不增加脚本／测试框架，COS 仅用 Action 内置 verify。PR 只检查和构建，不合并或部署。

此前 0.34.3 验收：项目没有 definition-attached tests。此前 0.30.0 的八项 native
数值对照只属于历史验收，不冒称当前完整数值测试。最终正式依赖图下，113/113 全定义（含依赖）、16/16 项目定义、完整 strict
passed / diagnostics=[]、Caps 五模块和工具链、immutable、JS 生成／语法检查与原 CDN
构建均通过；deprecated-call、dynamic-method、应用 unsafe 为零。
实际默认图形、蓝／黄两个控制点拖动后的反射和网格重绘、刷新回默认场景均通过，
error/warn 为空。未启用 remote-control、未做物理 gamepad 验收；原反射公式不以截图替代数学正确性证明。

The source is `calcit.cirru`; no `compact.cirru` or `package.cirru` is required.
Use Node 24 and Yarn 4.18.0:

```sh
caps --ci --strict
yarn install --immutable
calcit --check-only --all-defs
calcit fix --workflow strict --verify
calcit js
yarn vite
```

The state and control events use nominal Store/Op types, and vector calculations
use `quaternion.vector/V3`. Convert through coordinate lists at the geometric
algebra boundary; the two modules' V3 types have different identities. The unused
template `:states` event handler is retired. The two control points and original
reflection formulas are preserved.

CI checks and builds pull requests without deploying them. On main, frontend
resources are uploaded to `https://cos-sh.tiye.me/WebGPU-Art/play-rotor/`, using
the COS action's built-in checksum verification. The original page deployment
path `/web-assets/repo/${github.repository}` remains unchanged. Generated
`js-out/` and local Yarn install state are not tracked.

The npm touch-control package currently only publishes `0.0.4-a1`; it remains
pinned to that exact existing version rather than a floating prerelease range.

### License

MIT
