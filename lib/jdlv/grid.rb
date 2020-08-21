# frozen_string_literal: true

module Jdlv
  # The Grid in the game.
  class Grid
    attr_reader :x_axis_length, :y_axis_length

    def initialize(last_position = Position.new, occupied_positions = [])
      @x_axis_length = last_position.x_axis
      @y_axis_length = last_position.y_axis
      @occupied_positions = Jdlv::PositionsLoader.load occupied_positions
    end

    def area
      @x_axis_length * @y_axis_length
    end

    def number_occupied_positions
      @occupied_positions.length
    end

    def number_positions_occupied_around(position)
      positions_around = Jdlv::PositionsLocator.around(position)
      positions_around.select { |neighbour| @occupied_positions.key? neighbour }.length
    end

    def occupied_position?(position)
      @occupied_positions.key? position
    end

    def tick
      request_review_occupied_positions
      next_occupied_positions = review_next_occupied_positions
      request_update_occupied_positions
      occupy next_occupied_positions
      free_positions
    end

    def to_s
      "Pattern: #{@occupied_positions.keys.map(&:to_s).join('|')}"
    end

    private

    def request_review_occupied_positions
      @occupied_positions.each_value do |cell|
        cell.review_state self
      end
    end

    def find_all_relevant_positions
      @occupied_positions.keys.map do |position|
        Jdlv::PositionsLocator.around(position)
      end.flatten
    end

    def find_current_free_positions
      free_positions = Set.new
      free_positions.merge(find_all_relevant_positions)
      free_positions.delete_if { |position| occupied_position? position }
      free_positions
    end

    def review_next_occupied_positions
      find_current_free_positions.select do |position|
        number_positions_occupied_around(position) == 3
      end
    end

    def request_update_occupied_positions
      @occupied_positions.each_value(&:update_state)
    end

    def occupy(new_free_positions)
      @occupied_positions.merge! Jdlv::PositionsLoader.load(new_free_positions)
    end

    def free_positions
      positions = []
      @occupied_positions.each_key do |position|
        cell = @occupied_positions[position]
        positions.push position if cell.current_state == :free
      end
      positions.each { |position| @occupied_positions.delete position }
    end
  end
end
