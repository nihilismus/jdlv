# frozen_string_literal: true

RSpec.describe Jdlv::Position do
  it 'is on the negative side of the x axis' do
    expect(described_class.new.x_axis).to satisfy(&:negative?)
  end

  it 'is on the negative side of the y axis' do
    expect(described_class.new.y_axis).to satisfy(&:negative?)
  end

  it 'is in the positive side of x axis' do
    expect(described_class.new(4, 8).x_axis).to satisfy(&:positive?)
  end

  it 'is in the positive side of y axis' do
    expect(described_class.new(4, 8).y_axis).to satisfy(&:positive?)
  end
end
