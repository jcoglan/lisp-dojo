module RubyLisp
  class Function
  end
  
  class ArithmeticFunction < Function
    def initialize(value)
      @value = value
    end
    
    def call(scope, args)
      raise ArgumentError.new("too many toooooooooooooo. need two") if args.size > 2
      raise ArgumentError.new("too feeeeeeeeeeeeeeeeew") if args.size != 2
      eval("#{args[0].eval(scope)} #{@value} #{args[1].eval(scope)}")
    end
    
  end
  
  class DefineStatement < Function
    def call(scope, args)
      scope[args[0].value] = args[1].eval(scope)
    end
  end
  
  class IfStatement < Function
    def call(scope, args)
      args[0].eval(scope) ? args[1].eval(scope) : args[2].eval(scope)
    end
  end
end

