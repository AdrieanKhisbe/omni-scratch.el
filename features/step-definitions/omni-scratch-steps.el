;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.

(Before
 (switch-to-buffer "current-buffer"))

(After
 (kill-buffer "current-buffer")
 (setq omni-scratch-origin-buffer nil))

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

(When "^I call with universal arg \"\\(.+\\)\"$"
   (lambda (func)
     (let ((v (vconcat [?\C-u ?\M-x] (string-to-vector func))))
       (execute-kbd-macro v))))

(Then "^I should have \\([0-9]+\\) windows$"
      (lambda (nwindow)
        (let ((windows (get-buffer-window-list)))
          (eq nwindow (length windows)))))

(Then "^I should have \"\\([^\"]+\\)\" buffer as window$"
     (lambda (buffername)
       (member (mapcar (lambda (bn) (equal bn buffername))
                       (mapcar 'buffer-name (mapcar 'window-buffer (get-buffer-window-list)))) t)))
