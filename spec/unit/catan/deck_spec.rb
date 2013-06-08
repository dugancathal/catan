require 'spec_helper'

describe Catan::ResourceDeck do
  def resources
    Catan::ResourceCard.types.each_with_object({}) {|type, h| h[type] = 19}
  end

  it 'builds #card_counts cards' do
    deck = Catan::ResourceDeck.new(resources)
    deck.cards.count.must_equal 19*5
  end

  it 'requires a hash argument' do
    lambda { Catan::ResourceDeck.new(19) }.must_raise ArgumentError
  end
end

describe Catan::DevelopmentDeck do
  it 'builds #card_counts cards' do
    deck = Catan::DevelopmentDeck.new(knight: 20)
    deck.cards.count.must_equal 20
  end

  it 'requires a hash argument' do
    lambda { Catan::DevelopmentDeck.new(19) }.must_raise ArgumentError
  end
end
