module RubyLisp::Boolean
  def eval(scope)
    # Booleans are either '#t' or '#f', so they should eval
    # to true for '#t', false otherwise
    value == '#t'
  end
end

