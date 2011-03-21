@step11
Feature: Tail call optimization

  Scenario: Tail-recursive function
    When I run the program
    """
    (define add (lambda (n x)
                  (if (= 0 n)
                      x
                      (add (- n 1)
                           (+ x 1)))))
    
    (add 10000 1)
    """
    Then I should get "10001"
