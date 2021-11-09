(ql:quickload "fiveam")
(ql:quickload "fiveam-asdf")
(ql:quickload "hello-world")
(sb-ext:save-lisp-and-die "hello-world.core" :executable nil)
