module Slideable
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
            possible_moves.concat(grow_unblocked_moves_in_dir(dx,dy))
        end

        possible_moves.include?(end_pos)
    end

    def moves_dirs
        raise NotImplementedError
    end

    private
    def grow_unblocked_moves_in_dir(dx, dy)
        cur_x, cur_y = @pos

        moves = []

        loop do
            cur_x, cur_y = cur_x + dx, cur_y + dy
            new_pos = [cur_x, cur_y]

            break unless @board.valid_pos?(new_pos)

            if @board.empty?(new_pos)
                moves << new_pos
            else
                if !@board[new_pos].is_a? String
                    moves << new_pos if @board[new_pos].color != @color
                end
                break
            end
        end

        moves
    end
end