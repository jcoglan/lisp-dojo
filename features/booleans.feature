@step1
Feature: Boolean literals

  Scenario: The true literal
    When I run the program
    """
      #t
    """
    Then I should get "true"

  Scenario: The false literal
    When I run the program
    """
      #f
    """
    Then I should get "false"

