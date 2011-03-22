module RubyLisp
  class Scope
    def []=(name, value)
      bindering[name] = value
    end
    
    def [](name)
      bindering[name]
    end
    
    def bindering
      @binding ||= {}
    end
  end
  
  class TopLevelScope < Scope
  end
end

