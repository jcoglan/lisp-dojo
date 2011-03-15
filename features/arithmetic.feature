@step4
Feature: Arithmetic functions

  Scenario Outline: Arithmetic operators
    When I run the program
    """
      <program>
    """
    Then I should get "<result>"
  Examples:
    | program  | result |
    | (+ 3 4)  | 7      |
    | (- 8 2)  | 6      |
    | (* 9 7 ) | 63     |
    | (/ 12 4) | 3      |

  Scenario Outline: Comparison operators
    When I run the program
    """
      <program>
    """
    Then I should get "<result>"
  Examples:
    | program  | result |
    | (> 4 3)  | true   |
    | (> 7 8)  | false  |
    | (>= 3 3) | true   |
    | (>= 3 5) | false  |
    | (< 4 3)  | false  |
    | (< 7 8)  | true   |
    | (<= 3 3) | true   |
    | (<= 5 3) | false  |
    | (= 7 7)  | true   |
    | (= 9 2)  | false  |

  Scenario: Compound expression
    When I run the program
    """
      (* (+ (- 9 3)
            2)
         (/ 36 9))
    """
    Then I should get "32"

