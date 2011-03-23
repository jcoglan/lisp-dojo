module RubyLisp
  class Function
    def initialize(&block)
      # Built-in functions are implemented as Ruby Procs
      @body = block
    end
    
    def call(args)
      @body.call(*args)
    end
  end
end

