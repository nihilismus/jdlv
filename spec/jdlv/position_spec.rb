# frozen_string_literal: true

RSpec.describe Jdlv::Position do
  it 'is in the positive side of x axis' do
    position = described_class.new(4, 8)
    expect(position.positive_x_axis?).to be true
  end

  it 'is in the positive side of y axis' do
    position = described_class.new(4, 8)
    expect(position.positive_y_axis?).to be true
  end

  it 'is not on the positive side of the x axis' do
    position = described_class.new
    expect(position.positive_x_axis?).not_to be true
  end

  it 'is not on the positive side of the y axis' do
    position = described_class.new
    expect(position.positive_y_axis?).not_to be true
  end
end
