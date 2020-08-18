# frozen_string_literal: true

module Jdlv
  # The Grid in the game.
  class Grid
    def initialize(last_position, occupied_positions)
      @last_position = last_position
      @state = PositionsLoader.load occupied_positions
    end

    def area
      @last_position.x_axis * @last_position.y_axis
    end

    def x_axis_length
      @last_position.x_axis
    end

    def y_axis_length
      @last_position.y_axis
    end

    def occupied_cells_count
      @state.length
    end

    # Load Position objects into a Hash of
    # Position object -> Cell object
    class PositionsLoader
      def self.load(positions)
        initial_state = {}
        positions.each do |position|
          initial_state[position] = Cell.new(position)
        end
        initial_state
      end
    end
  end
end
