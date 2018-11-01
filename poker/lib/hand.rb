require_relative "deck"
require_relative "card"

class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end
  
  def receive_card(card)
    raise ArgumentError unless card.is_a? Card
    raise TooManyCardError if @cards.length == 5
    @cards << card
  end
  
  def matches
    hash = Hash.new
    @cards.each do |card|
      if hash.has_key?(card.value)
        hash[card.value] += 1
      else
        hash[card.value] = 1
      end
    end
    hash
  end
  
  def one_pair
    pair = matches.select {|card_value, amount| amount.length == 2}
    pair.keys
  end
  
  def two_pair
    pair = matches.select {|card_value, amount| amount.length == 2}
    return pair.keys if pair.keys.length > 1 
    []
  end
  
  def three_of_a_kind
    trips = matches.select {|card_value, amount| amount.length == 3}
    pair.keys
  end
  
  def four_of_a_kind
    pair = matches.select {|card_value, amount| amount.length == 4}
    pair.keys    
  end
  
  def full_house
    pair = one_pair
    trips = three_of_a_kind
    unless pair.empty? && trips.empty? 
      return trips
    end
    []
  end
  
  def straight
    sorted = @cards.sort_by { |card| card.value }
    i = 1
    while i < sorted.length
      return [] if sorted[i].value < sorted[i - 1].value
      i += 1
    end
    sorted.last.value
  end
  
  def flush
    sorted = @cards.sort_by { |card| card.value }
    first_suit = @cards.first.suit
    return sorted.last.value if @cards.all? { |card| card.suit == first_suit }
    []
  end
  
  def straight_flush
    return [] if straight.empty? || flush.empty?
    straight
  end

end
















class TooManyCardError < ArgumentError ; end