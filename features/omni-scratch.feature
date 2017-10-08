Feature: Quickly edit some program
  In order to edit some program in a dedicated mode
  As a programmer
  I want to quickly have scratch sandbox

  Scenario: Have just a fundamental scratch
    When I call "omni-scratch"
    Then I should be in buffer "*scratch:draft*"
    And major mode should be fundamental-mode
    And omni-scratch should be a minor mode

  Scenario: Have just a emacs-lisp scratch
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-major"
    Then I should be in buffer "*scratch:emacs-lisp*"
    And major mode should be emacs-lisp-mode
    And omni-scratch should be a minor mode

  Scenario: I can go back to the emacs-lisp scratch
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-major"
    And I switch to buffer "my-mode.el"
    And I turn on emacs-lisp-mode
    And  I call "omni-scratch-major"
    Then I should be in buffer "*scratch:emacs-lisp*"
    And major mode should be emacs-lisp-mode

  Scenario: I can go back to my origin buffer
    When I call "omni-scratch"
    Then I should be in buffer "*scratch:draft*"
    When I call "omni-scratch"
    Then I should be in buffer "current-buffer"

  Scenario: I can go back to my origin buffer in major
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-major"
    Then I should be in buffer "*scratch:emacs-lisp*"
    When I call "omni-scratch-major"
    Then I should be in buffer "current-buffer"

 Scenario: I can go to latest
    Given current major mode is emacs-lisp-mode
    When I call "omni-scratch-major"
    And I switch to buffer "my-mode.el"
    And I call "omni-scratch"
    And I switch to buffer "my-mode.el"
    And I call "omni-scratch-goto-latest"
    Then I should be in buffer "*scratch:draft*"

  Scenario: Save and Quit
    Given I am in buffer "my-program"
    When I call "omni-scratch"
    And I press "Hello World"
    And I call "omni-scratch-quit"
    Then I should be in buffer "my-program"
    And kill ring should contain "Hello World"

  Scenario: I can go to scratch buffer dedicated to file
    Given I am in buffer "my-program"
    When I call "omni-scratch-buffer"
    Then I should be in buffer "*scratch:my-program*"

  Scenario: I can go to scratch buffer dedicated to file with selected content
    Given I am in buffer "my-program.py"
    When I type "Titi='Toto'"
    And  I turn on python-mode
    And  I select "Titi"
    Then the region should be "Titi"
    When I call "omni-scratch-buffer"
    Then I should be in buffer "*scratch:my-program.py*"
    And  major mode should be python-mode
    And  I should see "Titi"

  Scenario: I can go to scratch in other windows
    Given I am in buffer "my-program"
    And I call with universal arg "omni-scratch"
    Then I should be in buffer "*scratch:draft*"
