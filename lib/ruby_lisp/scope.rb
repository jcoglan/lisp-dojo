module RubyLisp
  class Scope
    def initialize
      # A Scope's job is to store variables
      @vars = {}
    end
    
    # Backend for the 'define' keyword
    def []=(name, value)
      @vars[name] = value
    end
    
    # Backend for resolving variable references
    def [](name)
      value = @vars[name]
      raise "Undefined variable: #{name}" if value.nil?
      value
    end
  end
  
  class TopLevelScope < Scope
    def initialize
      super
      # The top level is special, and defines the built-in functions
      
      # We can implement builtins as Ruby blocks
      self['+'] = Function.new { |a,b| a + b }
      self['-'] = Function.new { |a,b| a - b }
      self['*'] = Function.new { |a,b| a * b }
      self['/'] = Function.new { |a,b| a / b }
      
      self['<']  = Function.new { |a,b| a <  b }
      self['<='] = Function.new { |a,b| a <= b }
      self['>']  = Function.new { |a,b| a >  b }
      self['>='] = Function.new { |a,b| a >= b }
      
      self['='] = Function.new { |a,b| a == b }
    end
  end
end

