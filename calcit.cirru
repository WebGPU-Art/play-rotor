
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |memof/ |quaternion/ |lagopus/ |geometric/ |js-ffi/
      :type-slots $ {}
  :files $ {}
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'PolylineItem $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defunion PolylineItem app.comp.container/RotorPoint lagopus.comp.curves/PolylineBreak
          :examples $ []
          :schema $ quote UnionDef
        'RotorPoint $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum RotorPoint
            :vertex (Tuple Number Number Number) Number Number
          :examples $ []
          :schema $ quote EnumDef
        'as-v3-list $ %{} 'CodeEntry
          :doc "|non-zero zero values, need a custom function, for now.\n\nTODO move to core."
          :code $ quote $ defn as-v3-list (v)
            match v $
              :ga3 s x y z xy yz zx xyz
              assert-type ([] x y z) (Tuple Number Number Number)
          :examples $ []
          :schema $ quote $ Fn geometric.core/Ga3
            -> $ Tuple Number Number Number
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-container (store)
            group nil (comp-axis)
              comp-drag-point
                {}
                  :position $ v3-to-list $ :control-a store
                  :color $ [] 0.3 0.3 0.9 1.0
                  :size 8
                fn (move d!)
                  hint-fn $ Fn quaternion.vector/V3
                    Fn Op $ -> Unit
                    -> Unit
                  d! $ Op :control-a move
              comp-drag-point
                {}
                  :position $ v3-to-list $ :control-b store
                  :color $ [] 0.9 0.9 0.1 1.0
                  :size 8
                fn (move d!)
                  hint-fn $ Fn quaternion.vector/V3
                    Fn Op $ -> Unit
                    -> Unit
                  d! $ Op :control-b move
              comp-polylines-marked $ {}
                :writer $ fn (write!)
                  hint-fn $ Fn
                    Fn (List PolylineItem) (-> Unit)
                    -> Unit
                  write-rotor! store write!
                :shader lines-wgsl
          :examples $ []
          :schema $ quote $ Fn app.state/Store (-> JsObject)
        'grid-perp-to $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn grid-perp-to (v write! w m scale)
            let
                n 10
                v1-base $ v-normalize $ v-cross v (v3 0 0 -1)
                v2-base $ v-normalize $ v-cross v v1-base
                v1 $ v-scale v1-base scale
                v2 $ v-scale v2-base scale
              &doseq
                x $ range
                  inc $ negate n
                  , n
                let
                    d $ v-scale v1 x
                  write! $ []
                    app.comp.container/RotorPoint :vertex
                      v3-to-list $ v+ d $ v-scale v2 n
                      , w m
                    app.comp.container/RotorPoint :vertex
                      v3-to-list $ v+ d $ v-scale v2 (negate n)
                      , w m
                    , break-mark
              &doseq
                x $ range
                  inc $ negate n
                  , n
                let
                    d $ v-scale v2 x
                  write! $ []
                    app.comp.container/RotorPoint :vertex
                      v3-to-list $ v+ d $ v-scale v1 n
                      , w m
                    app.comp.container/RotorPoint :vertex
                      v3-to-list $ v+ d $ v-scale v1 (negate n)
                      , w m
                    , break-mark
          :examples $ []
          :schema $ quote $ Fn quaternion.vector/V3
            Fn (List PolylineItem) (-> Unit)
            , Number Number Number (-> Unit)
        'v3-list-0 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def v3-list-0
            assert-type ([] 0 0 0) (Tuple Number Number Number)
          :examples $ []
          :schema $ quote $ Tuple Number Number Number
        'v3-to-list $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn v3-to-list (v)
            match v $
              :v3 x y z
              assert-type ([] x y z) (Tuple Number Number Number)
          :examples $ []
          :schema $ quote $ Fn quaternion.vector/V3
            -> $ Tuple Number Number Number
        'write-rotor! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn write-rotor! (store write!)
            let
                p0 $ assert-type ([] 80 40 0) (Tuple Number Number Number)
                p1 $ assert-type ([] 80 120 0) (Tuple Number Number Number)
                p2 $ assert-type ([] 120 120 40) (Tuple Number Number Number)
                p3 $ assert-type ([] 160 40 0) (Tuple Number Number Number)
                w 2
                a $ :control-a store
                b $ :control-b store
                use-rotor-a $ fn (p)
                  hint-fn $ Fn (Tuple Number Number Number)
                    -> $ Tuple Number Number Number
                  as-v3-list $ ga3:reflect (ga3:from-v3-list p)
                    ga3:from-v3-list $ v3-to-list a
                use-rotor-ab $ fn (p)
                  hint-fn $ Fn (Tuple Number Number Number)
                    -> $ Tuple Number Number Number
                  as-v3-list $ ga3:reflect
                    ga3:reflect (ga3:from-v3-list p)
                      ga3:from-v3-list $ v3-to-list a
                    ga3:from-v3-list $ v3-to-list b
                a-line 2.0
                b-line 5.1
                shape-0 -1.2
                shape-1 2.0
                shape-2 5.1
              write! $ [] (app.comp.container/RotorPoint :vertex p0 w shape-0) (app.comp.container/RotorPoint :vertex p1 w shape-0) (app.comp.container/RotorPoint :vertex p2 w shape-0) (app.comp.container/RotorPoint :vertex p3 w shape-0) (app.comp.container/RotorPoint :vertex p0 w shape-0) (app.comp.container/RotorPoint :vertex p2 w shape-0) break-mark (app.comp.container/RotorPoint :vertex p0 w shape-0) (app.comp.container/RotorPoint :vertex p1 w shape-0) (app.comp.container/RotorPoint :vertex p3 w shape-0) break-mark
              write! $ []
                app.comp.container/RotorPoint :vertex (use-rotor-a p0) w shape-1
                app.comp.container/RotorPoint :vertex (use-rotor-a p1) w shape-1
                app.comp.container/RotorPoint :vertex (use-rotor-a p2) w shape-1
                app.comp.container/RotorPoint :vertex (use-rotor-a p3) w shape-1
                app.comp.container/RotorPoint :vertex (use-rotor-a p0) w shape-1
                app.comp.container/RotorPoint :vertex (use-rotor-a p2) w shape-1
                , break-mark
                  app.comp.container/RotorPoint :vertex (use-rotor-a p0) w shape-1
                  app.comp.container/RotorPoint :vertex (use-rotor-a p1) w shape-1
                  app.comp.container/RotorPoint :vertex (use-rotor-a p3) w shape-1
                  , break-mark
              write! $ []
                app.comp.container/RotorPoint :vertex (use-rotor-ab p0) w shape-2
                app.comp.container/RotorPoint :vertex (use-rotor-ab p1) w shape-2
                app.comp.container/RotorPoint :vertex (use-rotor-ab p2) w shape-2
                app.comp.container/RotorPoint :vertex (use-rotor-ab p3) w shape-2
                app.comp.container/RotorPoint :vertex (use-rotor-ab p0) w shape-2
                app.comp.container/RotorPoint :vertex (use-rotor-ab p2) w shape-2
                , break-mark
                  app.comp.container/RotorPoint :vertex (use-rotor-ab p0) w shape-2
                  app.comp.container/RotorPoint :vertex (use-rotor-ab p1) w shape-2
                  app.comp.container/RotorPoint :vertex (use-rotor-ab p3) w shape-2
                  , break-mark
              write! $ []
                app.comp.container/RotorPoint :vertex v3-list-0 (* 1 w) a-line
                app.comp.container/RotorPoint :vertex (v3-to-list a) (* 0.1 w) a-line
                , break-mark
              grid-perp-to a write! (* 0.2 w) a-line 47
              write! $ []
                app.comp.container/RotorPoint :vertex v3-list-0 (* 0.5 w) b-line
                app.comp.container/RotorPoint :vertex (v3-to-list b) (* 0.5 w) b-line
                , break-mark
              grid-perp-to b write! (* 0.2 w) b-line 31
          :examples $ []
          :schema $ quote $ Fn app.state/Store
            Fn (List PolylineItem) (-> Unit)
            -> Unit
          :tests $ [] $ %{} 'TestEntry (:name |default-polyline-segments)
            :code $ quote $ let
                *previous $ ref $ assert-type None (Option lagopus.comp.curves/MarkedPolylinePrevious)
                *segments $ ref $ assert-type ([])
                  List $ List lagopus.comp.curves/MarkedPolylineVertex
                collect! $ fn (vertices)
                  hint-fn $ Fn (List lagopus.comp.curves/MarkedPolylineVertex) (-> Unit)
                  reset! *segments $ append @*segments vertices
                  , &unit
              write-rotor! @app.main/*store $ fn (items)
                hint-fn $ Fn (List PolylineItem) (-> Unit)
                &doseq (item items)
                  match item
                    (app.comp.container/RotorPoint vertex) (lagopus.comp.curves/build-polyline-points-marked *previous vertex collect!)
                    (lagopus.comp.curves/PolylineBreak marker) (lagopus.comp.curves/build-polyline-points-marked *previous marker collect!)
                , &unit
              assert= 99 $ .len @*segments
              let
                  first-shape $ .unwrap $ nth @*segments 0
                  next-piece $ .unwrap $ nth @*segments 5
                  first-grid $ .unwrap $ nth @*segments 22
                  second-grid $ .unwrap $ nth @*segments 61
                assert= first-shape next-piece
                assert= (v3 80 40 0)
                  match
                    .unwrap $ nth first-shape 0
                    (:vertex position _ _ _ _) position
                assert= (v3 80 120 0)
                  match
                    .unwrap $ nth first-shape 1
                    (:vertex position _ _ _ _) position
                assert= 2 $ match
                  .unwrap $ nth first-grid 0
                  (:vertex _ _ _ _ mark) mark
                assert= 5.1 $ match
                  .unwrap $ nth second-grid 0
                  (:vertex _ _ _ _ mark) mark
              assert= None @*previous
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require
            lagopus.alias :refer $ group object
            |../shaders/lines.wgsl :default lines-wgsl
            lagopus.comp.button :refer $ comp-button comp-drag-point
            lagopus.comp.curves :refer $ comp-curves comp-axis comp-polylines comp-polylines-marked break-mark
            lagopus.comp.spots :refer $ comp-spots
            memof.once :refer $ memof1-call
            geometric.core :refer $ ga3:from-v3-list ga3:as-v3-list ga3:reflect ga3:from-v3
            lagopus.comp.cube :refer $ comp-cube
            quaternion.vector :refer $ v-scale v+ v-cross v-normalize v3
            app.state :refer $ Op
    'app.config $ %{} 'FileEntry
      :defs $ {}
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            &= |dev $ .unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ quote Bool
        'inline-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro inline-shader (path)
            read-file $ str |shaders/ path |.wgsl
          :examples $ []
          :schema $ quote $ Macro (Expr String)
            -> $ Expr String
            :capabilities :fs-read
        'remote-control? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def remote-control?
            .some? $ get-env |remote-control
          :examples $ []
          :schema $ quote Bool
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.config
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store
            Store :tab :cube :control-a (v3 200 10 0) :control-b $ v3 400 80 -80
          :examples $ []
          :schema $ quote $ Ref Store
        'canvas $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def canvas (query-canvas!)
          :examples $ []
          :schema $ quote lagopus.browser/Canvas
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            if dev? $ console-log! $ str op
            let
                store @*store
                next-store $ match op
                  (:tab t) (assoc store :tab t)
                  (:control-a v) (assoc store :control-a v)
                  (:control-b v) (assoc store :control-b v)
                  _ $ do (eprintln ":unknown op" op) store
              if (not= next-store store) (reset! *store next-store)
            , &unit
          :examples $ []
          :schema $ quote $ Fn Op (-> Unit) (:features :io :state)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (hint-fn Async)
            if dev? $ load-console-formatter!
            js-await $ initializeContext
            initializeCanvasTextures
            reset-clear-color! $ .unwrap-or bg-color $ lagopus.config/ClearColor :rgba 0.18 0.2 0.36 1
            render-app!
            renderControl
            startControlLoop 10 onControlEvent
            set! js/window.__lagopusHandleCompilationInfo handle-compilation
            set! js/window.onresize $ fn (e) (resetCanvasSize canvas) (initializeCanvasTextures) (paintLagopusTree)
            resetCanvasSize canvas
            add-watch! *store :change $ fn (next store) (render-app!)
            setupMouseEvents canvas
            if remote-control? $ setupRemoteControl
            paintLagopusTree
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (nil? build-errors)
              do (reset-memof1-caches!) (render-app!) (remove-watch! *store :change)
                add-watch! *store :change $ fn (next store) (render-app!)
                println |Reloaded.
                hud! |ok~ |OK
              hud! |error build-errors
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            let
                tree $ comp-container @*store
              renderLagopusTree tree dispatch!
              paintLagopusTree
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            app.comp.container :refer $ comp-container
            |@triadica/lagopus :refer $ setupMouseEvents onControlEvent paintLagopusTree renderLagopusTree initializeContext resetCanvasSize initializeCanvasTextures
            |@triadica/touch-control :refer $ renderControl startControlLoop
            app.config :refer $ dev? remote-control?
            |bottom-tip :default hud!
            |./calcit.build-errors :default build-errors
            memof.once :refer $ reset-memof1-caches!
            lagopus.util :refer $ handle-compilation reset-clear-color!
            lagopus.config :refer $ bg-color
            |@triadica/lagopus/lib/remote-control.mjs :refer $ setupRemoteControl
            lagopus.browser :refer $ query-canvas!
            app.state :refer $ Store Op
            quaternion.vector :refer $ v3
            js-ffi.shared :refer $ console-log!
    'app.state $ %{} 'FileEntry
      :defs $ {}
        'Op $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum Op (:tab Tag) (:control-a quaternion.vector/V3) (:control-b quaternion.vector/V3)
          :examples $ []
          :schema $ quote EnumDef
        'Store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct Store (:tab Tag) (:control-a quaternion.vector/V3) (:control-b quaternion.vector/V3)
          :examples $ []
          :schema $ quote StructDef
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.state
          :require $ quaternion.vector :refer $ v3
