require 'singleton'
require_relative "piece.rb"

class NullPiece < Piece
    include Singleton
    attr_reader :symbol

    def initialize
    end

    def moves
    end

    def symbol
        '\u2588'.colorize(color)
    end
end