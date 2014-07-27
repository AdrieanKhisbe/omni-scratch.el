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

;;

;;; Code:


(defun os:create-scratch-buffer (name mode)
  (interactive)
  ;; §maybe: create or also switch to?
  (let ((buffer (get-buffer-create name) ))
    ;;§select buffeR?
    (switch-to-buffer buffer)
    (funcall mode)
))

;; §todo: switch to THE buffer associated with current programming mode.
;; §maybe: integration with popwin
(defun os:test ()
  (interactive)
  (os:create-scratch-buffer "*scratch:draft*" 'fundamental-mode))



(os:test)
(provide 'omni-scratch)
;;; omni-scratch.el ends here