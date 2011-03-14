@step2
Feature: Number literals

  Scenario: Integer literal
    When I run the program
    """
      234
    """
    Then I should get "234"

  Scenario: Float literal
    When I run the program
    """
      3.14
    """
    Then I should get "3.14"

  Scenario: Negative literal
    When I run the program
    """
      -0.17
    """
    Then I should get "-0.17"

