;;; test-helper --- Test helper for omni-scratch

;;; Commentary:
;; test helper inspired from https://github.com/tonini/overseer.el/blob/master/test/test-helper.el

;;; Code:

(require 'f)

(defvar cpt-path
  (f-parent (f-this-file)))

(defvar omni-scratch-test-path
  (f-dirname (f-this-file)))

(defvar omni-scratch-root-path
  (f-parent omni-scratch-test-path))

(defvar omni-scratch-sandbox-path
  (f-expand "sandbox" omni-scratch-test-path))

(when (f-exists? omni-scratch-sandbox-path)
  (error "Something is already in %s. Check and destroy it yourself" omni-scratch-sandbox-path))

(defmacro within-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(let ((default-directory omni-scratch-sandbox-path))
     (when (f-exists? omni-scratch-sandbox-path)
       (f-delete default-directory :force))
     (f-mkdir omni-scratch-sandbox-path)
     ,@body
     (f-delete default-directory :force)))

(require 'undercover)
(undercover "*.el" "omni-scratch/*.el"
            (:exclude "*-test.el")
            (:send-report nil)
            (:report-file "/tmp/undercover-report.json"))
(require 'ert)
(require 'omni-scratch)

(provide 'test-helper)
;;; test-helper.el ends here
