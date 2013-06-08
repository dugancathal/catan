require "catan/version"

require 'enrar'

module Catan
  def self.initialize!
    Enrar.initialize!
  end
end

require 'catan/hex'
require 'catan/user'
