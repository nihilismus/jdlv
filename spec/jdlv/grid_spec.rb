# frozen_string_literal: true

RSpec.describe Jdlv::Grid do
  it 'has an area of 32' do
    last_position = Jdlv::Position.new(4, 8)
    expect(described_class.new(last_position, []).area).to eq(32)

    last_position = Jdlv::Position.new(8, 4)
    expect(described_class.new(last_position, []).area).to eq(32)
  end

  it 'has 3 occupied cells' do
    last_position = Jdlv::Position.new(4, 8)
    positions = [Jdlv::Position.new(1, 1), Jdlv::Position.new(2, 2), Jdlv::Position.new(1, 3)]
    expect(described_class.new(last_position, positions).occupied_cells).to eq(3)
  end
end
