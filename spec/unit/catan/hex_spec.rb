require 'spec_helper'

describe Catan::Hex do
  it 'should have 6 sides' do
    Catan::Hex.new.sides.count.should eq(6)
  end
end
