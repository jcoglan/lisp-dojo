!SLIDE center
# Build you a Lisp

!SLIDE bullets
# Our Lisp will have

* Booleans
* Numbers and arithmetic
* Variables
* Conditional logic
* User-defined functions, closures
* Tail call optimization?

!SLIDE
# Booleans

    @@@ ruby
    '#t' == true
    '#f' == false

!SLIDE
# Numbers

    @@@ ruby
    7, 3.14, -0.236 # etc.

!SLIDE
# Arithmetic

    @@@ ruby
    (+ 3 4)  ; -> 7
    (/ 12 6) ; -> 2
    
    (> 7 2)  ; -> #t
    
    (= 5 5)  ; -> #t
    (= 0 4)  ; -> #f

!SLIDE
# Variables

    @@@ ruby
    (define x 6)
    x ; -> 6
    
    (+ x 1) ; -> 7
    
    (- (* x 2) 3) ; -> 9

!SLIDE
# Conditional logic

    @@@ ruby
    (define x 0)
    (if (= x 0) 2 3) ; -> 2
    
    (define x 1)
    (if (= x 0) 2 3) ; -> 3

!SLIDE
# Functions

    @@@
    (lambda () (+ 1 1)) ; -> #<Function>
    
    (define max (lambda (x y)
                  (if (> x y)
                      x
                      y)))
    
    (max 3 4) ; -> 4

!SLIDE
# Closures

    @@@ ruby
    (define add (lambda (x)
                  (lambda (y)
                    (+ x y))))
    
    (define add-2 (add 2)) ; -> #<Function>
    
    (add-2 5) ; -> 7

!SLIDE
# (Extra credit) Tail calls

    @@@ ruby
    (define add (lambda (n x)
                  (if (= n 0)
                      x
                      (add (- n 1)
                           (+ x 1)))))
    
       (add 3000 1)
    == (add 2999 2)
    == (add 2998 3)
