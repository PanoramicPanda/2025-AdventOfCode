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
  # @param length [Integer] The length of the number to return
  # @return [Array] An array of numbers made from the string
  def string_to_largest_paired_numbers(string, length: 2)
    Engine::Logger.action "Converting [#{string}] into an array of numbers..."

    digits = string.chars
    size = digits.size

    # digit_sets[i][j] = best numeric string using j digits from i..end
    digit_sets = Array.new(size + 1) { Array.new(length + 1, "") }

    (size - 1).downto(0) do |i|
      (1..length).each do |j|
        take = digits[i] + digit_sets[i + 1][j - 1]
        skip = digit_sets[i + 1][j]

        # Compare by integer value
        digit_sets[i][j] = take.to_i > skip.to_i ? take : skip
      end
    end

    digit_sets[0][length].to_i
  end

  def solve_part_1
    Engine::Logger.action 'Solving Part 1...'
    raw_input = load_input('day_03.txt')
    total = 0
    raw_input.each do |line|
      number = string_to_largest_paired_numbers(line)
      Engine::Logger.debug "Highest number: #{number}"
      total += number
    end
    total
  end

  def solve_part_2
    Engine::Logger.action 'Solving Part 2...'
    raw_input = load_input('day_03.txt')
    total = 0
    raw_input.each do |line|
      number = string_to_largest_paired_numbers(line, length: 12)
      Engine::Logger.debug "Highest number: #{number}"
      total += number
    end
    total
  end

end

# Example Usage
if __FILE__ == $0
  # Engine::Logger.level = :debug
  solver = Lobby.new
  AdventHelpers.part_header(1)
  part_1_total = solver.solve_part_1
  Engine::Logger.info "The Joltage is: [#{part_1_total}]"
  part_2_total = solver.solve_part_2
  Engine::Logger.info "The Joltage is: [#{part_2_total}]"
end