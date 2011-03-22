RubyLisp::Function

module RubyLisp::Identifier
  def eval(scope)
    # Whoop yea, sepical caseees.
    case value
    when '+', '-', '*', '/', '>=', '<=', '<', '>'
      return RubyLisp::ArithmeticFunction.new(value)
    when '='
      return RubyLisp::ArithmeticFunction.new(value + '=' )
    else
      scope[value] or raise 'hell'
    end
  end
end

