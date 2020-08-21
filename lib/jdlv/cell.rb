# frozen_string_literal: true

module Jdlv
  # A Cell with a Position
  class Cell
    attr_reader :current_state, :next_state

    def initialize(position)
      @position = position
      @current_state = :occupied
      @next_state = :unknown
    end

    def review_state(grid)
      apply_rules grid.number_positions_occupied_around(@position)
    end

    def update_state
      @current_state = @next_state
      @next_state = :unknown
    end

    private

    def apply_rules(number_neighbours)
      @next_state = :free if number_neighbours < 2
      @next_state = :occupied if [2, 3].include? number_neighbours
      @next_state = :free if number_neighbours > 3
    end
  end
end
