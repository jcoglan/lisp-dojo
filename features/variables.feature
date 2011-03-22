Feature: Variables

  @step3
  Scenario: Evaluate a known variable
    Given the variable "the-var" has value "10"
    When I run the program
    """
      the-var
    """
    Then I should get "10"

  @step3
  Scenario: Evaluate an undefined variable
    When I run the program
    """
      unknown-var
    """
    Then I should get an error

  @step3
  Scenario: Evaluate a function reference
    When I run the program
    """
      +
    """
    Then I should get a function

  @step5
  Scenario: Defining a variable
    When I run the program
    """
      (define my-var 15)
      my-var
    """
    Then I should get "15"

  @step5
  Scenario: Storing a result in a variable
    When I run the program
    """
      (define k (+ (/ 21 3) 2))
      k
    """
    Then I should get "9"

