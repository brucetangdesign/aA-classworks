require 'colorize'

class Piece
    def initialize(color, pos)
        @color = color
        @pos = pos
    end

    def to_s
        "*".colorize(@color)
    end
end