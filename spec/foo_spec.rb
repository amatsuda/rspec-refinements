require 'spec_helper'

class Foo
  def has_should_method?
    self.methods.include?(:should)
  end

  def tes
    should
  end

  def tes2
    self.should
  end
end

describe Foo do
  # make sure the `should` method actually works inside an Example
  it { should be_a Foo }

  # the `should` method is not available outside of Example
  it { should_not have_should_method }
  specify { BasicObject.instance_methods.should_not include :should }

  specify {
    expect { Foo.new.tes }.to raise_error(NameError, /\Aundefined local variable or method `should' for #<Foo:/)
    expect { Foo.new.tes2 }.to raise_error(NoMethodError, /\Aundefined method `should' for #<Foo:/)
  }
end
