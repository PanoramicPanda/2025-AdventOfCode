require_relative '../utils/advent_helpers'
# Day 1 - Secret Entrance
#
# This class provides methods to calculate where a dial points on a number ring.
class SecretEntrance
  attr_accessor :instructions, :zero_resting_points, :flat_zero_points

  # Initializes a new instance of SecretEntrance.
  def initialize
    AdventHelpers.print_christmas_header(1, 'Secret Entrance')
    @instructions = []
    @zero_resting_points = 0
    @flat_zero_points = 0
    @current_position = 50
  end

  # Loads the input file, and adds each line to the instructions as [direction, amount].
  #
  # @param input_file [String] The name of the input file. Expected to be in the inputs directory.
  # @return [nil]
  def load_input(input_file)
    AdventHelpers.load_input_and_do(input_file) do |line|
      @instructions << [line[0],line[1..-1].to_i]
    end
  end

  # Traverses the dial based on the instructions array.
  # Raises an error if the instructions are empty.
  # @return [nil]
  def traverse_dial
    Engine::Logger.fatal 'There are no instructions loaded!' unless @instructions.length > 0
    @instructions.each do |instruction|
      direction = instruction[0]
      amount = instruction[1]
      Engine::Logger.action "Moving the Dial to the #{direction} #{amount} times"
      amount.times do
        if direction == 'L'
          @current_position -= 1
          if @current_position == -1
            @current_position = 99
          end
          if @current_position == 0
            @flat_zero_points += 1
          end
        else
          @current_position += 1
          if @current_position == 100
            @current_position = 0
          end
          if @current_position == 0
            @flat_zero_points += 1
          end
        end
      end
      if @current_position == 0
        @zero_resting_points += 1
      end
    end
  end
end

# Example Usage
if __FILE__ == $0
  solver = SecretEntrance.new
  solver.load_input('day_01.txt')
  AdventHelpers.part_header(1)
  solver.traverse_dial
  Engine::Logger.info "The password is: [#{solver.zero_resting_points}]"
  AdventHelpers.part_header(2)
  Engine::Logger.info "The actual password is: [#{solver.flat_zero_points}]"
end