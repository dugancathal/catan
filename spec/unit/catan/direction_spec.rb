require 'spec_helper'

include Catan
describe Direction do
  it 'knows its opposites' do
    Direction[:west].opposite.must_equal Direction[:east]
    Direction[:east].opposite.must_equal Direction[:west]
    Direction[:south].opposite.must_equal Direction[:north]
    Direction[:north].opposite.must_equal Direction[:south]
    Direction[:northeast].opposite.must_equal Direction[:southwest]
    Direction[:northwest].opposite.must_equal Direction[:southeast]
    Direction[:southeast].opposite.must_equal Direction[:northwest]
    Direction[:southwest].opposite.must_equal Direction[:northeast]
  end
end
