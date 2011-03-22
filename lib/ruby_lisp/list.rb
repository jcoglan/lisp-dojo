module RubyLisp::List
  def eval(scope)
    items = captures[:cell]
    function = items[0].eval(scope)
    args = items[1..-1]
    function.call(scope, args)
  end
end

