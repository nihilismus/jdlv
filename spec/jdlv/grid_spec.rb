# frozen_string_literal: true

RSpec.describe Jdlv::Grid do
  it 'has an area of 32' do
    position = Jdlv::Position.new(4, 8)
    expect(described_class.new(position, []).area).to eq(32)
  end

  it 'has an area of 32 too' do
    position = Jdlv::Position.new(8, 4)
    expect(described_class.new(position, []).area).to eq(32)
  end

  it 'has 3 occupied cells' do
    position = Jdlv::Position.new(4, 8)
    positions = [Jdlv::Position.new(1, 1), Jdlv::Position.new(2, 2), Jdlv::Position.new(1, 3)]
    expect(described_class.new(position, positions).occupied_cells_count).to eq(3)
  end
end
