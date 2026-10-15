## Play Rotor(Geometric Algebra)

> as an supplement for https://marctenbosch.com/quaternions/ .

### Workflow

本地候选升级至正式 Calcit / @calcit/procs 0.30.0，使用正式 Geometric 0.0.13。
反射公式、四个点及控制点不变；命名空间状态改用同一实现的首选名称 defref，保留热重载状态。
旧版与候选的实际反射表达式在 native 上 8 项数值输出一致，普通检查和 JS/Vite 构建通过。
完整 strict 仍受 Lagopus 已发布依赖阻塞，不能视为迁移完成；尚未提交 PR 或部署，
也未验收完整 WebGPU 渲染。没有新增永久测试脚本、类型强转或编译器规则。
The source is `calcit.cirru`; no `compact.cirru` or `package.cirru` is required.
Use Node 24 and Yarn 4.18.0:

```sh
caps --ci --strict
yarn install --immutable
calcit --check-only --all-defs
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
