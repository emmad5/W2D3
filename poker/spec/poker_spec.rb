require "card"
require "deck"
require "hand"

RSpec.describe Card do
  subject(:two_of_hearts) { Card.new(2, :heart) }
  describe "#initialize" do
    it "has a value" do
      expect(two_of_hearts.value).to eq(2)
    end
    it "has a suit" do
      expect(two_of_hearts.suit).to eq(:heart)
    end
  end
  describe "#display" do
    it "displays a pretty version of the card" do
      expect(two_of_hearts.display).to eq("two of ♡")
    end
  end
  
end

RSpec.describe Deck do 
  subject(:deck) { Deck.new }
  
  describe "#initialize" do
    it "has 52 cards" do
      expect(deck.deck.length).to eq(52)
    end
    it "has 4 of each value" do
      cards = Hash.new {[]}
      deck.deck.each { |card| cards[card.value] << card.suit }
      expect(cards.values.all? {|arr| arr.length == 4}).to be_truthy
    end
    
    it "has 13 of each suit" do
      cards = Hash.new {[]}
      deck.deck.each { |card| cards[card.suit] << card.value }
      expect(cards.values.all? {|arr| arr.length == 13}).to be_truthy
    end
  end
end

RSpec.describe Hand do
  subject(:hand) { Hand.new }
  let(:cards) {hand.cards}
  let(:two_of_hearts) { Card.new(2, :heart) }
  let(:three_of_hearts) { Card.new(3, :heart) }
  let(:four_of_hearts) { Card.new(4, :heart) }
  let(:five_of_hearts) { Card.new(5, :heart) }
  let(:six_of_hearts) { Card.new(6, :heart) }
  let(:two_of_clubs) { Card.new(2, :club) }
  let(:two_of_spades) { Card.new(2, :spade) }
  let(:ace_of_hearts) { Card.new(14, :heart) }
  
  describe "#initialize" do
    it "initializes hand as an empty array" do
      expect(cards.is_a? Array).to be_truthy
      expect(cards).to be_empty
      #expect(cards.all? { |card| card.is_a?(Card)}).to be_truthy
    end
  end
  
  describe "#receive_card" do
    it "only accepts cards" do
      expect {hand.receive_card("i am a card, right?")}.to raise_error(ArgumentError)
    end
    it "adds the card to its own cards" do
      hand.receive_card(two_of_hearts)
      expect(cards).not_to be_empty
      expect(cards).to include(two_of_hearts)
    end
    it "will not allow cards to be more than 5 cards" do
      hand.receive_card(two_of_hearts)
      hand.receive_card(three_of_hearts)
      hand.receive_card(four_of_hearts)
      hand.receive_card(five_of_hearts)
      hand.receive_card(six_of_hearts)
      expect { hand.receive_card(two_of_spades) }.to raise_error(TooManyCardError)
    end
  end
  
  describe "#has_pair?" do
    it "has two cards of the same value" do
      
    end
  end
end






























