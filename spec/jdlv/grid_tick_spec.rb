# frozen_string_literal: true

RSpec.describe Jdlv::Grid do
  let(:last_position) { Jdlv::Position.new(5, 5) }
  let(:glider) do
    [
      Jdlv::Position.new(2, 2), Jdlv::Position.new(3, 2), Jdlv::Position.new(4, 2),
      Jdlv::Position.new(4, 3),
      Jdlv::Position.new(3, 4)
    ]
  end
  let(:grid) { described_class.new(last_position, glider) }

  it 'does not change the number of occupied positions' do
    grid.tick
    expect(grid.number_occupied_positions).to eq(5)
  end

  it 'frees one original occupied position' do
    grid.tick
    expect(grid.occupied_position?(Jdlv::Position.new(2, 2))).to be false
  end

  it 'occupies one original free position' do
    grid.tick
    expect(grid.occupied_position?(Jdlv::Position.new(3, 1))).to be true
  end

  it 'keeps occupied one original occupied position' do
    grid.tick
    expect(grid.occupied_position?(Jdlv::Position.new(4, 3))).to be true
  end
end
