## Play Rotor(Geometric Algebra)

> as an supplement for https://marctenbosch.com/quaternions/ .

### Workflow

使用者影响：本轮升级正式 Calcit / @calcit/procs 0.31.0。四个点、两个拖动控制点及原反射公式不变，`hud!` 页面报错仍保留。命名空间状态使用 `defref`，保留热重载状态；网格的两处旧 `range-bothway 0 n` 改为 `range (inc (negate n)) n`，原 n=10 的 -9…9 范围及顺序不变。

依赖使用已发布的 Geometric 0.0.14、Lagopus 0.5.13、Memof 0.0.41、Quaternion 0.2.17 和 JS FFI 0.2.7。两个局部反射函数明确接受/返回 List<Number>，writer 使用实际 List<Enum>→Unit 回调合同；清理冗余 do 和旧 Struct 构造，不新增强转、编译器规则或类型豁免。

本地 113 个全定义、完整 strict workflow 和 Vite 构建通过；实际 WebGPU 页面验证默认图形及两个控制点拖动后的反射/网格重绘，浏览器 warning/error 为空。此前 0.30.0 候选的8项 native数值对照只属于历史验收，不冒称本轮完整数值测试；本轮仍需对应PR的远端CI与评审通过，不合并部署。

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
