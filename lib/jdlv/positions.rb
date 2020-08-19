# frozen_string_literal: true

module Jdlv
  # Based on a Position, locate it's positions around it
  module Positions
    def self.around(position)
      positions = []
      positions.concat(top(position))
      positions.concat(side(position))
      positions.concat(bottom(position))
      positions
    end

    def self.top(position)
      next_row = position.y_axis.next
      current_column = position.x_axis
      previous_column = current_column.pred
      next_column = current_column.next
      [
        Position.new(previous_column, next_row),
        Position.new(current_column, next_row),
        Position.new(next_column, next_row)
      ]
    end

    def self.side(position)
      current_row = position.y_axis
      current_column = position.x_axis
      previous_column = current_column.pred
      next_column = current_column.next
      [
        Position.new(previous_column, current_row),
        Position.new(next_column, current_row)
      ]
    end

    def self.bottom(position)
      previous_row = position.y_axis.pred
      current_column = position.x_axis
      previous_column = current_column.pred
      next_column = current_column.next
      [
        Position.new(previous_column, previous_row),
        Position.new(current_column, previous_row),
        Position.new(next_column, previous_row)
      ]
    end
  end
end
