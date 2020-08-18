# frozen_string_literal: true

RSpec.describe Jdlv::Cell do
  it 'is in a occupied current state' do
    expect(described_class.new(Jdlv::Position.new(4, 8)).current_state).to eq(:occupied)
  end

  it 'is in an unknown next state' do
    expect(described_class.new(Jdlv::Position.new(4, 8)).next_state).to eq(:unknown)
  end
end
