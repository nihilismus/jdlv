# frozen_string_literal: true

module Jdlv
  # A Position in a Grid with x and y axis.
  class Position
    attr_reader :x_axis, :y_axis

    def initialize(x_axis = 0, y_axis = 0)
      @x_axis = x_axis
      @y_axis = y_axis
    end

    def positive_x_axis?
      @x_axis.positive?
    end

    def positive_y_axis?
      @y_axis.positive?
    end
  end
end
