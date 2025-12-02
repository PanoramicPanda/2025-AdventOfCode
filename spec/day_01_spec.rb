require_relative '../puzzles/day_01'

RSpec.describe SecretEntrance do
  solver = SecretEntrance.new
  solver.instructions = [
    ['L', 68],
    ['L', 30],
    ['R', 48],
    ['L', 5],
    ['R', 60],
    ['L', 55],
    ['L', 1],
    ['L', 99],
    ['R', 14],
    ['L', 82]
  ]
  solver.traverse_dial

  it 'finds the correct zero points' do
    expect(solver.zero_resting_points).to eq(3)
  end

  it 'finds the correct flat zero points' do
    expect(solver.flat_zero_points).to eq(6)
  end

end