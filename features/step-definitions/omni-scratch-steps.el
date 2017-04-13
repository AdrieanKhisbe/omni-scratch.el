;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.


(Given "^current major mode is \\(.+\\)$"
  (lambda (mode)
    (call-interactively (intern mode))))

(Then "^major mode should be \\(.+\\)$"
  (lambda (mode)
    (equal major-mode (intern mode))))

(Then "^kill ring should contain \"\\([^\"]+\\)\"$"
      (lambda (text)
        (equal text (current-kill 0))))
