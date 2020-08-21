# frozen_string_literal: true

RSpec.describe Jdlv::PositionsLoader do
  let(:empty_positions) { [] }
  let(:some_positions) do
    [Jdlv::Position.new(1, 1), Jdlv::Position.new(1, 2), Jdlv::Position.new(1, 3)]
  end

  it 'returns an empty hash' do
    expect(described_class.load(empty_positions)).to eq({})
  end

  it 'returns a hash with 3 positions as keys' do
    expect(described_class.load(some_positions).keys).to match_array(some_positions)
  end
end
