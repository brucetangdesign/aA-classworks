module Stepable
    HORIZONTAL_AND_VERTICAL_DIRS = [
        [-1,0],
        [0,-1],
        [0,1],
        [1,0]
    ].freeze

    DIAGONAL_DIRS = [
        [-1,-1],
        [-1,1],
        [1,-1],
        [1,1]
    ].freeze

    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def valid_move?(end_pos)
        cur_x, cur_y = @pos

        possible_moves = []

        move_dirs.each do |dx, dy|
            new_pos = [cur_x + dx, cur_y + dy]
            if @board.valid_pos?(new_pos)
                possible_moves << new_pos if @board.empty?(new_pos) || @board[new_pos].color != @color                
            end
        end

        possible_moves.include?(end_pos)
    end

    def moves_dirs
        raise NotImplementedError
    end
end