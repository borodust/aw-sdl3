(asdf:defsystem :aw-sdl3
  :description "Thin wrapper over SDL3"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:aw-sdl3-bindings))


(asdf:defsystem :aw-sdl3/wrapper
  :description "Thin wrapper over SDL3"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :uiop :cffi :claw-utils :claw)
  :serial t
  :components ((:file "src/claw")
               (:module :sdl3-includes :pathname "src/lib/sdl/include/")))


(asdf:defsystem :aw-sdl3/example
  :description "aw-sdl3 example"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :static-vectors :aw-sdl3
                           :claw :cffi-c-ref :trivial-main-thread)
  :pathname "example/"
  :components ((:file "example")))
