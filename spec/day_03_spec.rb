require_relative '../puzzles/day_03'

RSpec.describe Lobby do
  solver = Lobby.new
  input_1 = '987654321111111'
  input_2 = '811111111111119'
  input_3 = '234234234234278'
  input_4 = '818181911112111'

  it 'converts the string into paired numbers and finds the highest correctly' do
    expect(solver.find_highest_number(solver.string_to_paired_numbers(input_1))).to eq(98)
    expect(solver.find_highest_number(solver.string_to_paired_numbers(input_2))).to eq(89)
    expect(solver.find_highest_number(solver.string_to_paired_numbers(input_3))).to eq(78)
    expect(solver.find_highest_number(solver.string_to_paired_numbers(input_4))).to eq(92)
  end

end