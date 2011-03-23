module RubyLisp
  class Function
    def initialize(&block)
      # Built-in functions are implemented as Ruby Procs
      @body = block
    end
    
    # Regular functions evaluate all their arguments
    def call(calling_scope, cells)
      args = cells.map { |c| c.eval(calling_scope) }
      @body.call(*args)
    end
  end
  
  class Syntax < Function
    # Syntaxes let each function decide what to eval
    def call(calling_scope, cells)
      @body.call(calling_scope, cells)
    end
  end
end

