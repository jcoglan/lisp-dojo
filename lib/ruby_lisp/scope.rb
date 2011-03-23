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
    
    # Shorthand for making builtins
    def function(name, &block)
      self[name] = Function.new(&block)
    end
    
    def syntax(name, &block)
      self[name] = Syntax.new(&block)
    end
  end
  
  class TopLevelScope < Scope
    def initialize
      super
      # The top level is special, and defines the built-in functions
      
      # We can implement builtins as Ruby blocks
      function('+') { |a,b| a + b }
      function('-') { |a,b| a - b }
      function('*') { |a,b| a * b }
      function('/') { |a,b| a / b }
      
      function('<')  { |a,b| a <  b }
      function('<=') { |a,b| a <= b }
      function('>')  { |a,b| a >  b }
      function('>=') { |a,b| a >= b }
      
      function('=') { |a,b| a == b }
      
      # 'define' is not a regular function as it does not
      # eval all its args. We'll call it a 'syntax'
      syntax('define') do |scope, cells|
        # Eval the second arg, and store it in the variable named by the first
        scope[cells[0].value] = cells[1].eval(scope)
      end
    end
  end
end

