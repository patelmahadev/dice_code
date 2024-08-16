# dice_simulator.rb

class Die
  attr_reader :sides, :value

  def initialize(sides)
    @sides = sides
    roll
  end

  def roll
    @value = rand(1..@sides)
  end
end

class DiceRoll
  attr_reader :dice, :total

  def initialize(dice_configurations)
    @dice = []
    @total = 0
    dice_configurations.each do |sides|
      die = Die.new(sides)
      @dice << die
      @total += die.value
    end
  end

  def result
    {
      dice: @dice.map { |die| { sides: die.sides, value: die.value } },
      total: @total
    }
  end

  def display_result
    puts "You rolled:"
    @dice.each_with_index do |die, index|
      puts "Die ##{index + 1} (#{die.sides} sides): #{die.value}"
    end
    puts "Total value: #{@total}"
  end
end

class DiceRollingSimulator
  def start
    puts "Welcome to the Dice Rolling Simulator!"
    
    print "How many dice would you like to roll? "
    number_of_dice = gets.to_i
    
    dice_configurations = []
    
    number_of_dice.times do |i|
      print "Enter the number of sides for die ##{i + 1}: "
      sides = gets.to_i
      dice_configurations << sides
    end

    dice_roll = DiceRoll.new(dice_configurations)
    dice_roll.display_result
  end
end

simulator = DiceRollingSimulator.new
simulator.start
