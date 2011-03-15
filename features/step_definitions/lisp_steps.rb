require 'rubygems'
require 'bundler/setup'
require 'rspec'

require File.dirname(__FILE__) + '/../../lib/ruby_lisp'

Before do
  @scope = RubyLisp::TopLevelScope.new
end

Given /^the variable "([^"]*)" has value "([^"]*)"$/ do |varname, value|
  @scope[varname] = eval(value)
end

When /^I run the program$/ do |source|
  begin
    @result = RubyLisp.parse(source).eval(@scope)
  rescue => e
    @error = e
  end
end

Then /^I should get "([^"]*)"$/ do |result|
  if @error
    p @error
    puts @error.backtrace
  end
  @error.should be_nil
  @result.should == eval(result)
end

Then /^I should get a function$/ do
  if @error
    p @error
    puts @error.backtrace
  end
  @error.should be_nil
  @result.should be_kind_of(RubyLisp::Function)
end

Then /^I should get an error$/ do
  @error.should be
end

