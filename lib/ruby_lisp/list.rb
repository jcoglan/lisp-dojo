module RubyLisp::List
  def eval(scope)
    # We eval a list by evaluating all its members. We assume
    # the first member evals to a function, and we call the
    # function with the remaining values
    values   = captures[:cell].map { |c| c.eval(scope) }
    function = values.first
    args     = values[1..-1]
    function.call(args)
  end
end

