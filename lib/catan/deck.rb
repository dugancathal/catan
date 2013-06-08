module Catan
  class Deck
    attr_reader :cards
    def initialize(card_counts)
      raise ArgumentError.new('args[0] must be a hash') unless card_counts.is_a? Hash
      @card_counts = card_counts
      @cards = []
      card_counts.each do |type, count|
        count.times do
          @cards << card_type.new(type)
        end
      end
    end

    def shuffle
      @cards.shuffle!
    end

    def card_type
      Catan.const_get("#{self.class.name.split(/(?=[A-Z])/)[1]}Card")
    end
  end

  class ResourceDeck < Deck
  end

  class DevelopmentDeck < Deck
  end
end
