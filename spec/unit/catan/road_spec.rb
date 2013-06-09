require 'spec_helper'

describe Catan::Road do
  before(:all) do
    @user = Catan::User.new 'test'
  end

  it 'can be a road' do
    road = Catan::Road.new @user
    road.road?.must_equal true
  end

  it 'can be a ship' do
    road = Catan::Road.new @user, ship: true
    road.road?.must_equal false
    road.ship?.must_equal true
  end

  it 'knows who it belongs to' do
    road = Catan::Road.new @user
    road.user.must_equal @user
  end
end
