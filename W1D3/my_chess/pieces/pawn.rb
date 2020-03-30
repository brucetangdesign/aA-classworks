require_relative 'piece.rb'

class Pawn < Piece
    def symbol
        '♟'.colorize(@color)
    end

    def valid_move?(end_pos)
        cur_x, cur_y = @pos
        possible_moves = []
        
        move_diffs.each do |coords|
            new_pos = [cur_x + coords[0], cur_y + coords[1]]
            possible_moves << new_pos if @board.valid_pos?(new_pos)
        end
        
        allowed_to_jump_moves.each do |coords|
            new_pos = [cur_x + coords[0], cur_y + coords[1]]    
            if !@board.empty?(new_pos) && @board.valid_pos?(new_pos)
                possible_moves << new_pos if @board[new_pos].color != @color
            end
        end
        
        possible_moves.include?(end_pos)
    end

    private

    def move_diffs
        moves = []

        if @color == @side1
            moves << [1,0]

            moves << [2,0] if @first_move
        else
            moves << [-1,0]
            moves << [-2,0] if @first_move
        end

        moves
    end

    def allowed_to_jump_moves
        moves = []

        if @color == @side1
            moves.concat([[1,-1], [1,1]])
        else
            moves.concat([[-1,-1], [-1,1]])
        end

        moves
    end
end