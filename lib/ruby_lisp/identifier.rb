module RubyLisp::Identifier
  def eval(scope)
    # Identifiers eval to whatever their name refers to
    # in the current scope
    scope[value]
  end
end

