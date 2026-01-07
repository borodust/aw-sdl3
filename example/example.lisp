(cl:defpackage :sdl3.example
  (:use :cl)
  (:export #:run))
(cl:in-package :sdl3.example)


(cffi:define-foreign-library
    (sdl3-clawed
     :search-path (asdf:system-relative-pathname :aw-sdl3
                                                 "src/lib/build/desktop/"))
  (:unix "libsdl3.clawed.so"))


(defun main-run ()
  (%sdl3:init %sdl3:+init-video+)
  (let ((window (cffi:with-foreign-string (name "AW-SDL3 Example Window")
                  (%sdl3:create-window name
                                       640 480
                                       %sdl3:+window-vulkan+))))
    (when (cffi:null-pointer-p window)
      (error "Failed to create a window"))
    (unwind-protect
         (progn
           (sleep 5)
           (%sdl3:destroy-window window))
      (%sdl3:quit))))


(defun run ()
  (unwind-protect
       (let ((errout *error-output*))
         (cffi:load-foreign-library 'sdl3-clawed)
         (flet ((%runner ()
                  (handler-case
                      (main-run)
                    (serious-condition (c) (format errout "~A" c)))))
           (trivial-main-thread:call-in-main-thread #'%runner :blocking t)))
    (cffi:close-foreign-library 'sdl3-clawed)))
