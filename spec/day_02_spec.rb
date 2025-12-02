require_relative '../puzzles/day_02'

RSpec.describe GiftShop do
  solver = GiftShop.new
  solver.translate_ranges('11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124')

  it 'finds the incorrect ids' do
    solver.find_invalid_id_in_half
    expect(solver.total_invalid_ids).to eq(1227775554)
  end

  it 'finds the incorrect ids with a repeated pattern' do
    solver.find_invalid_id_repeat
    expect(solver.total_invalid_ids).to eq(4174379265)
  end

end