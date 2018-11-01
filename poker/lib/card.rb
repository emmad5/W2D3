class Card
  attr_reader :value, :suit
  
  VALUES = {
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "jack",
    12 => "queen",
    13 => "king",
    14 => "ace"
  }
  
  SUITS = {
    :heart => "♡",
    :spade => "♠",
    :diamond => "♢",
    :clubs => "♣"
  }
  
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
  
  def display
    "#{VALUES[@value]} of #{SUITS[@suit]}"
  end
end