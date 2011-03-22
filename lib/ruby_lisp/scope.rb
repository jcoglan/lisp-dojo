module RubyLisp
  class Scope
    attr_accessor :bindering
    
    def []=(name, value)
      bindering[name] = value
    end
    
    def [](name)
      bindering[name]
    end
    
    def bindering
      @bindering ||= {}
    end
    
    def clonify
      s = Scope.new
      s.bindering = bindering.dup
      s
    end
  end
  
  class TopLevelScope < Scope
  end
end

