module RubyLisp
  class Function
    def initialize(params = nil, body = nil, &block)
      # 'Native' functions are implemented as Ruby Procs,
      # Library and user functions are Lisp trees
      @params = params
      @body = body || block
    end
    
    # Regular functions evaluate all their arguments
    def call(calling_scope, cells)
      args = cells.map { |c| c.eval(calling_scope) }
      
      # For native functions just call the block
      return @body.call(*args) if Proc === @body
      
      # For Lisp functions, create a new scope, bind the
      # args to the param names, then eval all the body expressions.
      
      # We MUST create a new scope or the variables we set
      # will clobber variables elsewhere in the call stack,
      # which breaks recursive functions. We inherit from the
      # calling scope so we can still 'see' variables and
      # functions defined outside this function
      scope = Scope.new(calling_scope)
      
      @params.each_with_index do |name, i|
        scope[name.value] = args[i]
      end
      
      @body.map { |c| c.eval(scope) }.last
    end
  end
  
  class Syntax < Function
    # Syntaxes let each function decide what to eval
    def call(calling_scope, cells)
      @body.call(calling_scope, cells)
    end
  end
end

