# frozen_string_literal: true

module Jdlv
  # A Position in a Grid with x and y axis.
  class Position
    attr_reader :x_axis, :y_axis

    def initialize(x_axis = -1, y_axis = -1)
      @x_axis = x_axis
      @y_axis = y_axis
    end
  end
end
