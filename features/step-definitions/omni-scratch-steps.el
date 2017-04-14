;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.

(Before
 (rename-buffer "current-buffer"))

(After
 (kill-buffer "current-buffer"))

(Given "^current major mode is \\(.+\\)$"
  (lambda (mode)
    (call-interactively (intern mode))))

(Then "^major mode should be \\(.+\\)$"
  (lambda (mode)
    (equal major-mode (intern mode))))

(Then "^kill ring should contain \"\\([^\"]+\\)\"$"
      (lambda (text)
        (equal text (current-kill 0))))

(Then "^omni-scratch should be a minor mode$"
     (lambda ()
       (bound-and-true-p omni-scratch-mode)))
