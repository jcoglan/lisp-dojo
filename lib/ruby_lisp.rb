module RubyLisp
  def self.parse(source)
    Lisp.parse(source)
  end
  
  ROOT = File.expand_path(File.dirname(__FILE__))
  
  autoload :Scope,         ROOT + '/ruby_lisp/scope'
  autoload :TopLevelScope, ROOT + '/ruby_lisp/scope'
  autoload :Function,      ROOT + '/ruby_lisp/function'
  
  autoload :Boolean,    ROOT + '/ruby_lisp/boolean'
  autoload :List,       ROOT + '/ruby_lisp/list'
  autoload :Number,     ROOT + '/ruby_lisp/number'
  autoload :Identifier, ROOT + '/ruby_lisp/identifier'
  
  module Program
    def eval(scope)
      captures[:cell].map { |cell| cell.eval(scope) }.last
    end
  end
  
  module Cell
    def value
      expression.value
    end
    
    def eval(scope)
      expression.eval(scope)
    end
  end
end

require 'citrus'
Citrus.require(RubyLisp::ROOT + '/lisp.citrus')

def parse(source)
  RubyLisp.parse(source)
end

