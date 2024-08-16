# spec/dice_simulator_spec.rb
require_relative 'dice_simulator'

RSpec.describe Die do
  describe '#initialize' do
    it 'assigns the correct number of sides to the die' do
      die = Die.new(6)
      expect(die.sides).to eq(6)
    end

    it 'rolls a value between 1 and the number of sides' do
      die = Die.new(6)
      expect(die.value).to be_between(1, 6).inclusive
    end
  end

  describe '#roll' do
    it 'returns a random value between 1 and the number of sides' do
      die = Die.new(20)
      expect(die.roll).to be_between(1, 20).inclusive
    end
  end
end

RSpec.describe DiceRoll do
  describe '#initialize' do
    it 'creates the correct number of dice' do
      dice_roll = DiceRoll.new([6, 8, 10])
      expect(dice_roll.dice.size).to eq(3)
    end

    it 'calculates the correct total' do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      dice_roll = DiceRoll.new([6, 8, 10])
      expect(dice_roll.total).to eq(15)
    end
  end
end