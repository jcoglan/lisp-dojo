module RubyLisp
  class Function
  end
  
  
  class UserFunction < Function
    attr_accessor :scope
    
    def initialize(scope, arg_list, function_definition)
      @scope = scope
      @arg_list = arg_list.captures[:cell].first.expression.captures[:cell].map{|param| param.value}
      @function_definition = function_definition
    end
    
    def call(scope, args)
      child_scope = @scope.clonify
      @arg_list.zip(args) {|name, value| child_scope[name] = value.eval(scope)}
      r = nil
      @function_definition.each{|x| r = x.eval(child_scope)}
      r
    end
    
  end
  
  class LambdaExpression < Function
    def call(scope, args)
      UserFunction.new(scope, args[0], args[1..-1])
    end
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
      name  = args[0].value
      value = args[1].eval(scope)
      scope[name] = value
      if value.is_a?(UserFunction)
        value.scope[name] = value
      end
      nil
    end
  end
  
  class IfExpression < Function
    def call(scope, args)
      args[0].eval(scope) ? args[1].eval(scope) : args[2].eval(scope)
    end
  end
    
end

