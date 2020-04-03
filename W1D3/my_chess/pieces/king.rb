require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
    include Stepable

    def symbol
        '♚'.colorize(@color)
    end

    def move_dirs
        horizontal_and_vertical_dirs + diagonal_dirs
    end
end