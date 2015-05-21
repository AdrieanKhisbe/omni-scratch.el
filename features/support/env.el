(require 'f)

(defvar omni-scratch-support-path
  (f-dirname load-file-name))

(defvar omni-scratch-features-path
  (f-parent omni-scratch-support-path))

(defvar omni-scratch-root-path
  (f-parent omni-scratch-features-path))

(add-to-list 'load-path omni-scratch-root-path)

(require 'omni-scratch)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
