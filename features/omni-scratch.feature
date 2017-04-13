Feature: Quickly edit some program
  In order to edit some program in a dedicated mode
  As a programmer
  I want to quickly have scratch sandbox

  Scenario: Have just a fundamental scratch
    When I call "omni-scratch-new-scratch-buffer"
    Then I should be in buffer "*scratch:draft*"
    And major mode should be fundamental-mode


  Scenario: Have just a emacs-lisp scratch
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-new-scratch-major-buffer"
    Then I should be in buffer "*scratch:emacs-lisp*"
    And major mode should be emacs-lisp-mode


 Scenario: I can go back to the emacs-lisp scratch
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-new-scratch-major-buffer"
    And I switch to buffer "my-mode.el"
    And I turn on emacs-lisp-mode
    And  I call "omni-scratch-new-scratch-major-buffer"
    Then I should be in buffer "*scratch:emacs-lisp*"
    And major mode should be emacs-lisp-mode
