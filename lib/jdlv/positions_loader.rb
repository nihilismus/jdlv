# frozen_string_literal: true

module Jdlv
  # Given a collection of Positions, save them in a Hash of
  # Position object -> Cell object
  module PositionsLoader
    def self.load(positions)
      a_hash = {}
      positions.each do |position|
        a_hash[position] = Cell.new(position)
      end
      a_hash
    end
  end
end
