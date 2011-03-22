RubyLisp::Function

module RubyLisp::Identifier
  def eval(scope)
    case value
    when '+', '-', '*', '/', '>=', '<=', '<', '>'
      return RubyLisp::ArithmeticFunction.new(value)
    when '='
      return RubyLisp::ArithmeticFunction.new(value + '=' )
    when 'define'
      return RubyLisp::DefineStatement.new
    when 'if'
      return RubyLisp::IfExpression.new
    when 'lambda'
      return RubyLisp::LambdaExpression.new
    else
      scope[value] or raise "Unknown identifier #{value}"
    end
  end
end

