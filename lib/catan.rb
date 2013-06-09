require "catan/version"

require 'enrar'

module Catan
  def self.initialize!
    Enrar.initialize!
  end
end

require 'catan/hex'
require 'catan/hex_point'
require 'catan/hex_grid'

require 'catan/user'

require 'catan/card'
require 'catan/deck'

require 'catan/road'
require 'catan/metropolis'
