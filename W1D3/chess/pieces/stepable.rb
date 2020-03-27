module Stepable
    def moves
        move_diffs.each do |moves|
            cur_x, cur_y = @pos
            dx, dy = moves
            new_pos = [cur_x + dx, cur_y + dy]

            next unless @board.valid_pos?(new_pos)

            if board.empty?(pos)
                moves << new_pos
            elsif board[pos].color != color
                moves << new_pos
            end
        end
    end

    private
    def move_diffs
        # subclass implements this
        raise NotImplementedError
    end
end