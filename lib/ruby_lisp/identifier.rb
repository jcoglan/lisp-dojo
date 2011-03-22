module RubyLisp::Identifier
  def eval(scope)
    return RubyLisp::Function.new if value == '+'
    scope[value] or raise 'hell'
  end
end

