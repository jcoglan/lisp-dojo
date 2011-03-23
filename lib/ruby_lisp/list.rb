module RubyLisp::List
  def eval(scope)
    # We eval a list by evaluating the first member, and
    # assuming it's a function reference. We pass the current
    # scope and remaining cells to the function, and it gets
    # to decide what to evaluate.
    
    cells    = captures[:cell]
    function = cells.first.eval(scope)
    args     = cells[1..-1]
    function.call(scope, args)
  end
end

