module RubyLisp::Number
  def eval(scope)
    # Numbers eval to their literal value
    value.to_f
  end
end

