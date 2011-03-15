@step6
Feature: Conditional logic

  Scenario: Simple if statement, true branch
    When I run the program
    """
      (if #t 33 45)
    """
    Then I should get "33"

  Scenario: Simple if statement, false branch
    When I run the program
    """
      (if #f 33 45)
    """
    Then I should get "45"

  Scenario: if statement with expressions
    When I run the program
    """
      (if (>= 9 4)
          (+ 3 2)
          (* 8 9))
    """
    Then I should get "5"

  Scenario: Do not eval both branches
    When I run the program
    """
      (define x 21)
      
      (if #t
          (define x 99)
          (define x 55))
      
      x
    """
    Then I should get "99"

