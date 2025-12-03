require_relative '../puzzles/day_03'

RSpec.describe Lobby do
  solver = Lobby.new
  input_1 = '987654321111111'
  input_2 = '811111111111119'
  input_3 = '234234234234278'
  input_4 = '818181911112111'

  it 'converts the string into paired numbers and finds the highest correctly' do
    expect(solver.string_to_largest_paired_numbers(input_1)).to eq(98)
    expect(solver.string_to_largest_paired_numbers(input_2)).to eq(89)
    expect(solver.string_to_largest_paired_numbers(input_3)).to eq(78)
    expect(solver.string_to_largest_paired_numbers(input_4)).to eq(92)
  end

  it 'converts the string into paired numbers and finds the highest correctly with length of 12' do
    expect(solver.string_to_largest_paired_numbers(input_1, length: 12)).to eq(987654321111)
    expect(solver.string_to_largest_paired_numbers(input_2, length: 12)).to eq(811111111119)
    expect(solver.string_to_largest_paired_numbers(input_3, length: 12)).to eq(434234234278)
    expect(solver.string_to_largest_paired_numbers(input_4, length: 12)).to eq(888911112111)
  end

end