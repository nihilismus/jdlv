# frozen_string_literal: true

module Jdlv
  # Given a Position, locate the positions around it
  module PositionsLocator
    def self.around(position)
      positions = []
      positions.concat(at_top(position))
      positions.concat(at_both_sides(position))
      positions.concat(at_bottom(position))
      positions
    end

    def self.at_top(position)
      next_row = position.next_y_axis
      [
        Position.new(position.previous_x_axis, next_row),
        Position.new(position.x_axis, next_row),
        Position.new(position.next_x_axis, next_row)
      ]
    end

    def self.at_both_sides(position)
      current_row = position.y_axis
      [
        Position.new(position.previous_x_axis, current_row),
        Position.new(position.next_x_axis, current_row)
      ]
    end

    def self.at_bottom(position)
      previous_row = position.y_axis.pred
      [
        Position.new(position.previous_x_axis, previous_row),
        Position.new(position.x_axis, previous_row),
        Position.new(position.next_x_axis, previous_row)
      ]
    end
  end
end
