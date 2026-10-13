## Play Rotor(Geometric Algebra)

> as an supplement for https://marctenbosch.com/quaternions/ .

### Workflow

Uses formal Calcit 0.29.1 and dependencies declared in `deps.cirru`.
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
