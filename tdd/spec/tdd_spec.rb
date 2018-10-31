require "tdd"

RSpec.describe Array do
  subject(:array) { Array.new([1, 4, 5, 2, 3, -1, -4])}
  
  
  describe "#my_uniq" do
    it "returns the unique elements" do
      expect(array.my_uniq).to eq(array.uniq)
    end
    
    it "returns the elements in the order they first appeared" do
      expect(array.my_uniq[0]).to eq(array.uniq[0])
      expect(array.my_uniq[2]).to eq(array.uniq[2])  
    end
  end
  
  describe "#two_sum" do
    let(:result) { array.two_sum }
    it "find all pairs where elements at the position sum to zero" do
      expect(result).to eq([[0, 5], [1, 6]])
    end
    it "sorts the pairs smaller index before bigger index" do
      expect(result[0][0]).to be <= result[0][1]
      expect(result[1][0]).to be <= result[1][1]
    end
  end
  
  describe "#my_transpose" do
    subject(:array) { Array.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) }
    
    it "converts rows to column and vice versa" do
      expect(array.my_transpose).to eq(array.transpose)
    end
  end
  
  describe "#stock_picker" do
    subject(:array) { Array.new([1 , 2, 4, 2, 5, 10, 2, 0]) }
    let(:result) {array.stock_picker}
    it "returns a pair of days" do
      expect(result.first).to be_between(0, 6)
      expect(result.last).to be_between(0, 6)
    end
    it "does not return a loss" do
      expect(result).not_to eq([5, 7])
    end
    it "doesn't allow you to sell before you buy" do 
      expect(result[0]).to be < result[1]
    end
    it "returns most profitable days" do
      expect(result).to eq([0, 5])
    end
  end
end


RSpec.describe TowerOfHanoi do
  subject(:game) { TowerOfHanoi.new }
  
  describe "#initialize" do
    it "starts with a 2D array that has a length of 3" do
      expect(game.towers.length).to eq(3)
      expect(game.towers.first).to be_kind_of(Array)
    end
    it "starts with rings on the first tower in order" do
      expect(game.towers.first).to eq([1, 2, 3])
    end
  end
  
  describe "#move" do
    it "won't allow to move off of any empty tower" do 
      expect { game.move(1, 2) }.to raise_error(ArgumentError)
    end
    it "won't allow moves that include a non-existing tower" do
      expect { game.move(-1, 1) }.to raise_error(ArgumentError)
      expect { game.move(0, 5) }.to raise_error(ArgumentError)    
    end
    
    it "moves the first ring in a tower" do 
      game.move(0, 1)
      expect(game.towers[1]).to eq([1])
      expect(game.towers[0]).to eq([2, 3])
    end
    
  end
  
  describe "#won?" do
   
  end
end















