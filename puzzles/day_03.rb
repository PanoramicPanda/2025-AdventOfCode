require_relative '../utils/advent_helpers'
# Day 2 - Lobby
#
# This class provides methods to load ranges of ids and determine when an id within is invalid
class Lobby
  # Initializes a new instance of Lobby.
  def initialize
    AdventHelpers.print_christmas_header(3, 'Lobby')
  end

  # Loads the input file, and sends each line into an array.
  #
  # @param input_file [String] The name of the input file. Expected to be in the inputs directory.
  # @return [array]
  def load_input(input_file)
    arr = []
    AdventHelpers.load_input_and_do(input_file) do |line|
      arr << line
    end
    arr
  end

  # Takes a string, turns it into an array of numbers, then pairs each number up with later numbers into a new array
  # @param string [String] The input string to transform
  # @return [Array] An array of numbers made from the string
  def string_to_paired_numbers(string)
    Engine::Logger.action "Converting [#{string}] into an array of numbers..."
    numbers = string.chars
    numbers_last_index = numbers.length - 1
    paired_numbers = []
    numbers.each_with_index do |num, i|
      unless i == numbers_last_index
        numbers[i+1..-1].each do |num2|
          paired_numbers << "#{num}#{num2}".to_i
        end
      end
    end
    paired_numbers
  end

  def find_highest_number(array)
    Engine::Logger.action 'Finding highest number...'
    array.sort.reverse[0]
  end

  def solve_part_1
    Engine::Logger.action 'Solving Part 1...'
    raw_input = load_input('day_03.txt')
    total = 0
    raw_input.each do |line|
      number = find_highest_number(string_to_paired_numbers(line))
      Engine::Logger.debug "Highest number: #{number}"
      total += number
    end
    total
  end

end

# Example Usage
if __FILE__ == $0
  Engine::Logger.level = :debug
  solver = Lobby.new
  AdventHelpers.part_header(1)
  part_1_total = solver.solve_part_1
  Engine::Logger.info "The Joltage is: [#{part_1_total}]"
end