require 'colorize'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'

class Board
    def initialize
        @board_size = 8
        @rows = Array.new(@board_size) {Array.new(@board_size, " ")}
        create_starting_grid
    end

    def [](pos)
        #raise "Invalid position" if !valid_pos?(pos)
        @rows[pos[0]][pos[1]]
    end

    def valid_pos?(pos)
        pos.all? {|coord| coord.between?(0,7)}
    end

    def empty?(pos)
        self[pos] == " "
    end

    def move_piece(start_pos,end_pos)
        start_row, start_col = start_pos
        end_row, end_col = end_pos
        raise "There is no piece at #{start_pos}" if empty?(start_pos)

        piece = @rows[start_row][start_col]
        raise "There is already a piece at #{end_pos}" if !empty?(end_pos) && self[end_pos].color == piece.color
        

        if piece.valid_move?(end_pos)
            piece.move(end_pos)
            @rows[end_row][end_col] = @rows[start_row][start_col]
            @rows[start_row][start_col] = " "
        else
            raise "Invalid move"
        end
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
        first_row = [Rook,"*","*","*","*","*","*","*"]

        (0...@board_size).each do |i|
            (0...@board_size).each do |j|
                if i == 0 || i == @board_size-1
                    color = (i == 0) ? :white : :yellow
                    if j == 0
                        @rows[i][j] = first_row[j].new(color, self, [i,j])
                    else
                        @rows[i][j] = "*".colorize(color)#first_row[j].new(color, [i,j])
                    end
                elsif
                    i == 1 || i == @board_size-2
                    color = (i == 1) ? :white : :yellow
                    @rows[i][j] = Pawn.new(color, self, [i,j])
                end
            end
        end
    end
end

b = Board.new
b.render
b.move_piece([1,1],[3,1])
b.render
