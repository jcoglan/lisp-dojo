module RubyLisp
  class Scope
    def initialize(parent = nil)
      # A Scope's job is to store variables. It may have
      # a parent scope, that it defers to if asked for
      # a variable it doesn't own
      @vars = {}
      @parent = parent
    end
    
    # Backend for the 'define' keyword
    def []=(name, value)
      @vars[name] = value
    end
    
    # Backend for resolving variable references
    def [](name)
      value = @vars[name]
      raise "Undefined variable: #{name}" if value.nil? and not @parent
      # Defer to the parent if we don't know the variable
      value.nil? ? @parent[name] : value
    end
    
    # Shorthand for making builtins
    def function(name, &block)
      self[name] = Function.new(self, &block)
    end
    
    def syntax(name, &block)
      self[name] = Syntax.new(self, &block)
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
        # if-branches are considered to be in 'tail position'
        Frame.new(which, scope)
      end
      
      # Lambda is a keyword that creates new functions
      syntax('lambda') do |scope, cells|
        params = cells.first.expression.captures[:cell]
        body = cells[1..-1]
        Function.new(scope, params, body)
      end
    end
  end
end

