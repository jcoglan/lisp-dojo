@step4
Feature: Arithmetic functions

  Scenario: Adding two integers
    When I run the program
    """
      (+ 3 4)
    """
    Then I should get "7"

  Scenario: Dividing two integers
    When I run the program
    """
      (/ 12 4)
    """
    Then I should get "3"

  Scenario: Greater than function
    When I run the program
    """
      (> 4 3)
    """
    Then I should get "true"
    When I run the program
    """
      (> 7 8)
    """
    Then I should get "false"

  Scenario: Equality function
    When I run the program
    """
      (= 4 3)
    """
    Then I should get "false"
    When I run the program
    """
      (= 3 3)
    """
    Then I should get "true"

  Scenario: Compound expression
    When I run the program
    """
      (* (+ (- 9 3)
            2)
         (/ 36 9))
    """
    Then I should get "32"

