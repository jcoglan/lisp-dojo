@step3
Feature: Variables

  Scenario: Evaluate a known variable
    Given the variable "the-var" has value "10"
    When I run the program
    """
      the-var
    """
    Then I should get "10"

  Scenario: Evaluate an undefined variable
    When I run the program
    """
      unknown-var
    """
    Then I should get an error

  Scenario: Evaluate a function reference
    When I run the program
    """
      +
    """
    Then I should get a function

