# frozen_string_literal: true

module Jdlv
  # The Grid in the game.
  class Grid
    attr_reader :area, :occupied_cells

    def initialize(last_position, occupied_positions)
      @last_position = last_position
      @occupied_positions = occupied_positions
      @position_cell = {}
      set_area(@last_position.x_axis, @last_position.y_axis)
      load_occupied_positions
      set_occupied_cells
    end

    private

    def set_area(x_axis, y_axis)
      @area = x_axis * y_axis
    end

    def load_occupied_positions
      @occupied_positions.each do |position|
        @position_cell[position] = Cell.new(position)
      end
    end

    def set_occupied_cells
      @occupied_cells = @position_cell.length
    end
  end
end
