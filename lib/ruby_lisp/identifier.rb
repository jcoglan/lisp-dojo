RubyLisp::Function

module RubyLisp::Identifier
  def eval(scope)
    # Whoop yea, sepical caseees.
    case value
    when '+', '-', '*', '/', '>=', '<=', '<', '>'
      return RubyLisp::ArithmeticFunction.new(value)
    when '='
      return RubyLisp::ArithmeticFunction.new(value + '=' )
    when 'define'
      return RubyLisp::DefineStatement.new
    when 'if'
      return RubyLisp::IfStatement.new
    else
      scope[value] or raise "Unknown identifier #{value}"
    end
  end
end

