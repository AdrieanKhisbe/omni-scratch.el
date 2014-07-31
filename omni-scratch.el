;;; omni-scratch.el --- Easy and mode-specific draft buffers

;; Copyright (C) 2014  Adrien Becchis

;; Author: Adrien Becchis <adriean.khisbe@live.fr>
;; Created:  2014-07-27
;; Version: 0.1
;; Keywords: convenience, languages, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; `os' is the namespace for internal function that are not part of the
;; public api of the mode.
;;

;;; Building-Notes:
;; §todo: switch to THE buffer associated with current programming mode.
;; §maybe: integration with popwin.

;;; Code:

(defvar os:latest-scratch-buffer (get-buffer "*scratch*")
  "The Latest scratch buffer used.")

(defun os:create-scratch-buffer (name mode) ;§tor? create or switch?
  (interactive)
  ;; §later: option noselect?
  ;; §maybe: create or also switch to?
  (let ((buffer (get-buffer-create name) ))
    (switch-to-buffer buffer)
    (setq os:latest-scratch-buffer buffer)
    (funcall mode)
    ;; §later: apply eventual modificatino to local modes.
    ;; [and var: maybe identify the scratch buffer]: local var and register in alist or so
    buffer))

(defun os:switch-to-latest-scratch-buffer ()
  "Switch to the `os:latest-scratch-buffer' used."
  (interactive)
  ;; §note: improve using ring. (so that handle dead buffer)
  (switch-to-buffer os:latest-scratch-buffer))

;; (defun os:test ()
;;   (interactive)
;;   (os:create-scratch-buffer "*scratch:draft*" 'fundamental-mode))

;; §todo: default mode and minor
;; §maybe: specific background
(defun new-scratch-buffer () ;§maybe : rename to `goto' (since unicity of these buffers)
  "Crate a new scratch buffer and switch too"
  (interactive)
   (switch-to-buffer
    (os:create-scratch-buffer "*scratch:draft*" 'fundamental-mode)))
;; ¤note: for now just one scratch buffer. later many different?

(defun new-scratch-major-buffer () ;§tmaybe:torename
  "Crate a new scratch buffer and switch too"
  (interactive)
   (switch-to-buffer
    (os:create-scratch-buffer
     (replace-regexp-in-string "\\(.*\\)-mode" "*scratch:\\1*"
			       (symbol-name major-mode)) major-mode)))

;; §later: scratch minor modefor this buffer: quick exist, copy content. save to file.
;; §later: filter mode where not applyable: ibuffer and others..


(provide 'omni-scratch)
;;; omni-scratch.el ends here
