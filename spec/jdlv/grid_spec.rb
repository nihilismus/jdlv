# frozen_string_literal: true

RSpec.describe Jdlv::Grid do
  it 'has an area of 32' do
    last_position = Jdlv::Position.new(4, 8)
    expect(described_class.new(last_position, []).area).to eq(32)

    last_position = Jdlv::Position.new(8, 4)
    expect(described_class.new(last_position, []).area).to eq(32)
  end
end
