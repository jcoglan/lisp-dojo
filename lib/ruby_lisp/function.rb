module RubyLisp
  class Function
  end
  
  class ArithmeticFunction < Function
    def initialize(value)
      @value = value
    end
    
    def call(args)
      raise ArgumentError.new("too many toooooooooooooo. need two") if args.size > 2
      raise ArgumentError.new("too feeeeeeeeeeeeeeeeew") if args.size != 2
      eval("#{args[0]} #{@value} #{args[1]}")
    end
    
  end

end

