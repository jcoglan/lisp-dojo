module RubyLisp
  module List
    # We eval a list by evaluating the first member, and
    # assuming it's a function reference. We pass the current
    # scope and remaining cells to the function, and it gets
    # to decide what to evaluate.
    
    # If we want tail recursion, we need to break with
    # recursive descent here and find an iterative way
    # to evaluate the list.
    def eval(scope)
      frame = Frame.new(self, scope)
      frame = frame.process! while Frame === frame
      frame
    end
  end
  
  # A Frame represents an expression to be evaluated in
  # a certain scope. The expression may be anything, not
  # just a List.
  class Frame
    def initialize(expr, scope)
      expr = expr.expression if Cell === expr
      @expression = expr
      @scope = scope
    end
    
    def process!
      # Eval the expression directly if not a list
      return @expression.eval(@scope) unless List === @expression
      
      cells    = @expression.captures[:cell]
      function = cells.first.eval(@scope)
      args     = cells[1..-1]
      
      # Native functions return a value, library functions
      # return another Frame for their tail expression
      function.call(@scope, args)
    end
  end
end

