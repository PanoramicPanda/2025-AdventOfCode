require_relative '../utils/advent_helpers'
# Day 2 - Gift Shop
#
# This class provides methods to load ranges of ids and determine when an id within is invalid
class GiftShop
  attr_accessor :id_ranges, :invalid_ids

  # Initializes a new instance of GiftShop.
  def initialize
    AdventHelpers.print_christmas_header(2, 'Gift Shop')
    @id_ranges = []
    @invalid_ids = []
  end

  # Loads the input file, and sends each line to the translate_ranges method.
  #
  # @param input_file [String] The name of the input file. Expected to be in the inputs directory.
  # @return [nil]
  def load_input(input_file)
    AdventHelpers.load_input_and_do(input_file) do |line|
      translate_ranges(line)
    end
  end

  # Splits the string by comma, then takes each value and makes a range that it then loads into @id_ranges.
  # @return [nil]
  def translate_ranges(string)
    split = string.split(",")
    split.each do |range|
      Engine::Logger.action "Loading the IDs [#{range}]..."
      range_split = range.split("-")
      @id_ranges << (range_split[0].to_i..range_split[1].to_i)
    end
  end

  # Goes through the ranges of IDs and looks for ones that are invalid.
  # Raises an error if the id_ranges are empty.
  # @return [nil]
  def find_invalid_id_in_half
    @invalid_ids = []
    Engine::Logger.fatal 'There are no ID Ranges loaded!' unless @id_ranges.length > 0
    Engine::Logger.action "Looking for Invalid IDs via symmetrical halves..."
    @id_ranges.each do |id_range|
      id_range.each do |id|
        chars = id.to_s.chars
        chars_length = chars.length
        if chars_length.even?
          first_half = chars.take(chars_length/2)
          second_half = chars.drop(chars_length/2)
          if first_half == second_half
            @invalid_ids << id
          end
        end
      end
    end
  end

  # Checks if the ID is a repeated pattern of numbers
  # @return [Boolean] Is the ID a repeated pattern?
  def repeated_pattern?(id)
    string_id = id.to_s
    length = string_id.length
    (1..length/2).each do |sub_length|
      if length % sub_length == 0
        sub = string_id[0, sub_length]
        return true if sub * (length/sub_length) == string_id
      end
    end
    false
  end

  # Navigates through all IDs and looks specifically for repeated patterns
  # @return [nil]
  def find_invalid_id_repeat
    @invalid_ids = []
    Engine::Logger.fatal 'There are no ID Ranges loaded!' unless @id_ranges.length > 0
    Engine::Logger.action "Looking for Invalid IDs via repeated patterns..."
    @id_ranges.each do |id_range|
      id_range.each do |id|
        @invalid_ids << id if repeated_pattern?(id)
      end
    end
  end

  # Sums all invalid IDs
  # @return [Integer] The total of all invalid IDs
  def total_invalid_ids
    Engine::Logger.action 'Summing the Invalid IDs...'
    @invalid_ids.length > 0 ? @invalid_ids.sum : 0
  end

end

# Example Usage
if __FILE__ == $0
  solver = GiftShop.new
  solver.load_input('day_02.txt')
  AdventHelpers.part_header(1)
  solver.find_invalid_id_in_half
  Engine::Logger.info "The invalid ID sum is: [#{solver.total_invalid_ids}]"
  AdventHelpers.part_header(2)
  solver.find_invalid_id_repeat
  Engine::Logger.info "The actual password is: [#{solver.total_invalid_ids}]"
end