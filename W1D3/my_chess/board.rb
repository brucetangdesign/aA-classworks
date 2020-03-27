require 'colorize'
require_relative 'pieces/piece.rb'

class Board
    def initialize
        @board_size = 8
        @rows = Array.new(@board_size) {Array.new(@board_size, " ")}
        create_starting_grid
    end

    def render
        #system("clear")

        puts ""
        top_row = "  "
        (0...@board_size).each { |i| top_row += i.to_s.colorize(:blue) + " " }
        puts top_row

        @rows.each_with_index do |row,idx|
            row_to_str = ""
            bg_color = (idx % 2 == 0) ? :black : :light_black
            row.each do |piece|
                bg_color = bg_color==:black ? :light_black : :black
                row_to_str += "#{piece.to_s.colorize(:background => bg_color)} "
            end

            puts "#{idx.to_s.colorize(:blue)} #{row_to_str}"
        end
    end

    private
    def create_starting_grid
        first_row = [Piece,Piece, Piece, Piece, Piece, Piece, Piece, Piece]

        (0...@board_size).each do |i|
            (0...@board_size).each do |j|
                if i == 0 || i == @board_size-1
                    color = (i == 0) ? :white : :yellow
                    @rows[i][j] = first_row[j].new(color, [i,j])
                elsif
                    i == 1 || i == @board_size-2
                    color = (i == 1) ? :white : :yellow
                    @rows[i][j] = Piece.new(color, [i,j])
                end
            end
        end
    end
end

b = Board.new
b.render