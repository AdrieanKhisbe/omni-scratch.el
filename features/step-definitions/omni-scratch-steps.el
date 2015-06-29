;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.


(Given "^current major mode is \\(.+\\)$"
  (lambda (mode)
    (call-interactively (intern mode))))

(And "^major mode should be \\(.+\\)$"
  (lambda (mode)
    (equal major-mode (intern mode))))
