# frozen_string_literal: true

module Jdlv
  # The Grid in the game.
  class Grid
    attr_reader :area

    def initialize(last_position, occupied_positions)
      @last_position = last_position
      @occupied_positions = occupied_positions
      set_area(@last_position.x_axis, @last_position.y_axis)
    end

    private

    def set_area(x_axis, y_axis)
      @area = x_axis * y_axis
    end
  end
end
