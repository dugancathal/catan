module Catan
  class Card
    @types = []
    attr_reader :type
    def initialize(type)
      raise "#{type} is not a valid #{self.class}" unless self.class.types.include? type
      @type = type
    end

    def self.types
      @types
    end
  end

  class ResourceCard < Card
    @types = %i(brick grain lumber ore wool)
  end

  class DevelopmentCard < Card
    @types = %i(knight victory_point road_building year_of_plenty monopoly)
  end
end
