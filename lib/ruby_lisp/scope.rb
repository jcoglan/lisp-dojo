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
      
      # The following are not a regular functions as they does not
      # eval all their args. We'll call them 'syntaxes'
      
      # Eval the second arg, and store it in the variable named by the first
      syntax('define') do |scope, cells|
        scope[cells[0].value] = cells[1].eval(scope)
      end
      
      # Eval the first arg. If true, eval the second, else eval the third
      syntax('if') do |scope, cells|
        which = cells[0].eval(scope) ? cells[1] : cells[2]
        which.eval(scope)
      end
      
      # Lambda is a keyword that creates new functions
      syntax('lambda') do |scope, cells|
        body = cells[1..-1]
        Function.new(body)
      end
    end
  end
end

