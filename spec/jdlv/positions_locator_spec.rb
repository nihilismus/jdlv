# frozen_string_literal: true

RSpec.describe Jdlv::PositionsLocator do
  let(:position) { Jdlv::Position.new(3, 3) }
  let(:neighbours_at_top) do
    [Jdlv::Position.new(2, 4), Jdlv::Position.new(3, 4), Jdlv::Position.new(4, 4)]
  end
  let(:neighbours_at_both_sides) do
    [Jdlv::Position.new(2, 3), Jdlv::Position.new(4, 3)]
  end
  let(:neighbours_at_bottom) do
    [Jdlv::Position.new(2, 2), Jdlv::Position.new(3, 2), Jdlv::Position.new(4, 2)]
  end
  let(:neighbours_around) do
    neighbours_at_top.concat(neighbours_at_both_sides).concat(neighbours_at_bottom)
  end

  it 'finds the neighbours at the top' do
    expect(described_class.at_top(position)).to match_array neighbours_at_top
  end

  it 'finds the neighbours at both sides' do
    expect(described_class.at_both_sides(position)).to match_array neighbours_at_both_sides
  end

  it 'finds the neighbours at the bottom' do
    expect(described_class.at_bottom(position)).to match_array neighbours_at_bottom
  end

  it 'finds the neighbours around' do
    expect(described_class.around(position)).to match_array neighbours_around
  end
end
