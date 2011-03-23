module RubyLisp
  class Function
    def initialize(body = nil, &block)
      # 'Native' functions are implemented as Ruby Procs,
      # Library and user functions are Lisp trees
      @body = body || block
    end
    
    # Regular functions evaluate all their arguments
    def call(calling_scope, cells)
      args = cells.map { |c| c.eval(calling_scope) }
      
      # For native functions just call the block
      return @body.call(*args) if Proc === @body
      
      # For Lisp functions, eval the body expressions
      @body.map { |c| c.eval(calling_scope) }.last
    end
  end
  
  class Syntax < Function
    # Syntaxes let each function decide what to eval
    def call(calling_scope, cells)
      @body.call(calling_scope, cells)
    end
  end
end

