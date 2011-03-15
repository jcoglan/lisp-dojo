Feature: User-defined functions

  @step7
  Scenario: lambda creates a function
    When I run the program
    """
      (lambda () (+ 5 6))
    """
    Then I should get a function

  @step8
  Scenario: Calling a 0-ary one-line function
    When I run the program
    """
      (define nine (lambda () (+ 4 5)))
      (nine)
    """
    Then I should get "9"

  @step8
  Scenario: Calling a 0-ary multiline function
    When I run the program
    """
      (define ten (lambda ()
                    (define x 7)
                    (define y 3)
                    (+ x y)))
      (ten)
    """
    Then I should get "10"

  @step9
  Scenario: Calling a 2-ary function
    When I run the program
    """
      (define max (lambda (x y)
                    (if (> x y)
                        x
                        y)))
      
      (max 3 6)
    """
    Then I should get "6"

  @step9
  Scenario: Functions can recurse
    When I run the program
    """
      (define factorial (lambda (x)
                          (if (= 0 x)
                              1
                              (* (factorial (- x 1))
                                 x))))
      (factorial 6)
    """
    Then I should get "720"

  @step9
  Scenario: Variables are scoped to the function
    When I run the program
    """
      (define square (lambda (x) (* x x)))
      
      (define x 8)
      (square 3)
      x
    """
    Then I should get "8"

  @step10
  Scenario: Functions are lexical closures
    When I run the program
    """
      (define add (lambda (x)
                    (lambda (y)
                      (+ x y))))
      
      (define add2 (add 2))
      (add2 4)
    """
    Then I should get "6"

