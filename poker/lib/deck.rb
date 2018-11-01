require_relative "card"




class Deck
  attr_reader :deck
  
  SUITS = {
    :heart => "♡",
    :spade => "♠",
    :diamond => "♢",
    :clubs => "♣"
  }
    def initialize
    @deck = Array.new
    populate
  end
  
  def populate
    (2..14).each do |value|
      SUITS.keys.each do |suit|
        @deck << Card.new(value, suit)
      end
    end
  end
end