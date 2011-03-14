require 'rubygems'
require 'bundler/setup'
require 'rspec'

require File.dirname(__FILE__) + '/../../lib/ruby_lisp'

Before do
  @scope = RubyLisp::Scope.new
end

When /^I run the program$/ do |source|
  @result = RubyLisp.parse(source).eval(@scope)
end

Then /^I should get "([^"]*)"$/ do |result|
  @result.should == eval(result)
end

