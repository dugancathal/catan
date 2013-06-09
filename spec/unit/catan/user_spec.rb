require 'spec_helper'

describe Catan::User do
  before do
    @username = 'test'
    @user = Catan::User.new @username
  end

  it 'has a name' do
    @user.name.must_equal @username
  end

  it 'has an inventory' do
    @user.inventory.must_be_kind_of Hash
  end

  describe '#inventory' do
    it 'starts with default amounts' do
      @user.inventory[:settlements].must_equal 5
      @user.inventory[:cities].must_equal 4
      @user.inventory[:roads].must_equal 15
      @user.inventory[:ships].must_equal 15
    end
  end

  describe '#resource_hand' do
    it 'is an array' do
      @user.hand.must_be_kind_of Array
    end

    it 'starts empty' do
      @user.hand.must_equal []
    end
  end
end
