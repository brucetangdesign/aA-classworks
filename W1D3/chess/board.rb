require "colorize"
require_relative "pieces"

class Board
    def initialize
        @board_size = 8;
        @sentinel = NullPiece.instance
        place_starting_pieces
    end

    def [](pos)
        raise 'invalid_pos' unless valid_pos?(pos)

        @rows[pos[0]][pos[1]]
    end

    def []=(pos,piece)
        raise 'invalid_pos' unless valid_pos?(pos)

        row, col = pos

        @rows[row][col] = piece
    end

    def add_piece(piece,pos)
        raise 'position not empty' unless empty?(pos)
        self[pos] = piece
    end

    def move_piece(start_pos,end_pos)
        start_row, start_col = start_pos
        end_row, end_col = end_pos
        raise "There is no piece at #{start_pos}" if @rows[start_row][start_col] == nil
        raise "There is already a piece at #{end_pos}" if @rows[end_row][end_col] != nil

        @rows[end_row][end_col] = @rows[start_row][start_col]
        @rows[start_row][start_col] = nil
    end

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end

    def empty?(pos)
        self[pos].empty?
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

    def place_starting_pieces
        @rows = Array.new(@board_size) {Array.new(@board_size, @sentinel)}
        first_row = [Rook, Bishop, Knight, Queen, King, Knight, Bishop, Rook]

        (0...@board_size).each do |i|
            (0...@board_size).each do |j|
                if i == 0 || i == @board_size-1
                    color = (i == 0) ? :white : :yellow
                    @rows[i][j] = first_row[j].new(color, self, [i,j])
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
p b[[0,1]]