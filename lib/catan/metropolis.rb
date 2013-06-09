module Catan
  class Metropolis
    attr_reader :user
    def initialize(user, opts = {})
      @is_city = (opts[:city] || false)
      @user = user
    end

    def settlement?
      !@is_city
    end

    def city?
      @is_city
    end
  end
end
