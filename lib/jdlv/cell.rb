# frozen_string_literal: true

module Jdlv
  # A Cell with a Position
  class Cell
    attr_reader :current_state, :next_state

    def initialize(position)
      @position = position
      @current_state = :occupied
      @next_state = nil
    end
  end
end
