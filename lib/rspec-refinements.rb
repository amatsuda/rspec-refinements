require 'rspec-refinements/version'
require 'rspec'

# Module.module_eval do
#   undef :describe
# end

BasicObject.class_eval do
  undef :should
  undef :should_not
end

module RSpec
  module Refinements
    module ExampleMethods
      refine BasicObject do
        # copied from rspec-expectation/expectations/syntax.rb
        def should(matcher=nil, message=nil, &block)
          ::RSpec::Expectations::PositiveExpectationHandler.handle_matcher(self, matcher, message, &block)
        end

        def should_not(matcher=nil, message=nil, &block)
          ::RSpec::Expectations::NegativeExpectationHandler.handle_matcher(self, matcher, message, &block)
        end
      end
    end
  end
end

RSpec.configure do |c|
  c.before :all do
    # ugly but works...
    RSpec.world.example_groups.each do |eg|
      eg.send :using, RSpec::Refinements::ExampleMethods
    end
  end
#   c.extend Module.new { using RspecRefinements::ExampleMethods }
end
