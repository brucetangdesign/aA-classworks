require_relative "piece.rb"

class Rook < Piece
    def symbol
        '♜'.colorize(@color)
    end
end