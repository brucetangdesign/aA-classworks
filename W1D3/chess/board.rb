require "colorize"
require_relative "piece.rb"

class Board
    def initialize
        @board_size = 8;
        @rows = Array.new(@board_size) {Array.new}
        place_pieces
        
        @sentinel = nil
    end

    def place_pieces
        (0...@board_size).each do |i|
            (0...@board_size).each do |j|
                if i > 1 && i < @board_size-2
                    @rows[i] << nil
                else
                    @rows[i] << Piece.new
                end
            end
        end
    end

    def move_piece(start_pos,end_pos)
        start_row, start_col = start_pos
        end_row, end_col = end_pos
        raise "There is no piece at #{start_pos}" if @rows[start_row][start_col] == nil
        raise "There is already a piece at #{end_pos}" if @rows[end_row][end_col] != nil

        @rows[end_row][end_col] = @rows[start_row][start_col]
        @rows[start_row][start_col] = nil

        p @rows
    end

    def render
        #system("clear")

        puts ""
        top_row = "    "
        (0...@board_size).each { |i| top_row += i.to_s.colorize(:blue) + " " }
        puts top_row
    end
end

b = Board.new
b.move_piece([0,0],[3,1])