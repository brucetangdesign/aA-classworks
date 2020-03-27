require 'colorize'

class Piece
    attr_reader :color

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @first_move = true

        @side1 = :white
        @side2 = :yellow
    end

    def to_s
        self.symbol
    end

    def move(pos)
        @first_move = false
        @pos = pos
    end
end