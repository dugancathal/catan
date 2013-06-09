require 'spec_helper'

describe Catan::Metropolis do
  before(:all) do
    @user = Catan::User.new 'test'
  end

  it 'can be a settlement' do
    road = Catan::Metropolis.new @user
    road.settlement?.must_equal true
  end

  it 'can be a city' do
    road = Catan::Metropolis.new @user, city: true
    road.settlement?.must_equal false
    road.city?.must_equal true
  end

  it 'knows who it belongs to' do
    road = Catan::Metropolis.new @user
    road.user.must_equal @user
  end
end
