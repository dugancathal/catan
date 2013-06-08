require 'spec_helper'

describe Catan::ResourceCard do
  it 'can be any of the Resource Types' do
    card = Catan::ResourceCard.new(:grain)
    card.type.must_equal :grain
  end

  it "raises an exception if it doesn't know a type" do
    lambda {Catan::ResourceCard.new(:rock)}.must_raise RuntimeError
  end
end

describe Catan::DevelopmentCard do
  it 'can be any of the Development Types' do
    card = Catan::DevelopmentCard.new(:knight)
    card.type.must_equal :knight
  end

  it "raises an exception if it doesn't know a type" do
    lambda {Catan::DevelopmentCard.new(:year_of_famine)}.must_raise RuntimeError
  end
end
