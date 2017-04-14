;;; Test for `omni-scratch'

;;; Commentary:
;; These are the tests for `omni-scratch'

;;; Code:

(ert-deftest omni-scratch-should-not-pass ()
  (should-not nil))

(ert-deftest omni-scratch-helm-select ()
    (get-buffer-create "buffer-test")
    (get-buffer-create "a")
    (with-mock
     (stub helm => "buffer-test")
     (stub helm-build-sync-source => nil)
     (omni-scratch-buffers)
     (should (equal (buffer-name) "buffer-test"))))
