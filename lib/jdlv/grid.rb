# frozen_string_literal: true

module Jdlv
  # The Grid in the game.
  class Grid
    attr_reader :x_axis_length, :y_axis_length

    def initialize(last_position = Position.new, occupied_positions = [])
      @x_axis_length = last_position.x_axis
      @y_axis_length = last_position.y_axis
      @state = PositionsLoader.load occupied_positions
    end

    def area
      @x_axis_length * @y_axis_length
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
