module RubyLisp::List
  def eval(scope)
    items = captures[:cell].map{|c| c.eval(scope)}
    function = items[0]
    args = items[1..-1]
    function.call(args)
  end
end

