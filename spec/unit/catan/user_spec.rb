require 'spec_helper'

describe Catan::User do
  before do
    @username = 'test'
    @user = Catan::User.new @username
  end

  it 'has a name' do
    @user.name.must_equal @username
  end
end
