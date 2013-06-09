module Catan
  class Road
    attr_reader :user
    def initialize(user, opts = {})
      @is_ship = (opts[:ship] || false)
      @user = user
    end

    def road?
      !@is_ship
    end

    def ship?
      @is_ship
    end
  end
end
