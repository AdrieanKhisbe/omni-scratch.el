Feature: Quickly edit some program
  In order to edit some program in a dedicated mode
  As a programmer
  I want to quickly have scratch sandbox

  Scenario: Have just a fundamental scratch
    When I call "omni-scratch-buffer"
    Then I should be in buffer "*scratch:draft*"
    And major mode should be fundamental-mode
    And omni-scratch should be a minor mode

  Scenario: Have just a emacs-lisp scratch
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-major-buffer"
    Then I should be in buffer "*scratch:emacs-lisp*"
    And major mode should be emacs-lisp-mode
    And omni-scratch should be a minor mode

  Scenario: I can go back to the emacs-lisp scratch
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-major-buffer"
    And I switch to buffer "my-mode.el"
    And I turn on emacs-lisp-mode
    And  I call "omni-scratch-major-buffer"
    Then I should be in buffer "*scratch:emacs-lisp*"
    And major mode should be emacs-lisp-mode

  # Scenario: I can go back to my origin buffer
  #   Given current major mode is emacs-lisp-mode
  #   When I call "omni-scratch-major-buffer"
  #   Then I should be in buffer "*scratch:emacs-lisp*"
  #   When I call "omni-scratch-major-buffer"
  #   Then I should be in buffer "current-buffer"

  Scenario: I can go to latest
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-major-buffer"
    And I call "omni-scratch-buffer"
    And I switch to buffer "my-mode.el"
    And I call "omni-scratch-goto-latest"
    Then I should be in buffer "*scratch:draft*"

  Scenario: Save and Quit
    Given I am in buffer "my-program"
    When I call "omni-scratch-buffer"
    And I press "Hello World"
    And I call "omni-scratch-quit"
    Then I should be in buffer "my-program"
    And kill ring should contain "Hello World"
