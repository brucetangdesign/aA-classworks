require_relative "poly_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        build_move_tree
    end

    def build_move_tree

    end

    def self.valid_moves(position)
        grid_size = 8
        valid_moves = []
        row, col = position

        start_row = row > 1 ? row - 2 : row
        end_row = row + 2 < (grid_size-1) ? row + 2 : start_row
        start_col = col > 0 ? col - 1 : col + 1

        (start_row..(row+2)).step(2).each do |cur_row|
            if cur_row != row
                #find one left and one right
                    valid_moves << [cur_row,col-1] if col > 0
                    valid_moves << [cur_row,col+1] if col < grid_size-1
            else
                # in same row we move over 2 cols and up and down 1 row
                if row > 0
                    valid_moves << [row-1,col-2] if col > 1
                    valid_moves << [row-1,col+2] if col < grid_size - 2
                end

                if row < grid_size-2
                    valid_moves << [row+1,col-2] if col > 1
                    valid_moves << [row+1,col+2] if col < grid_size - 2
                end
            end
        end
        valid_moves
    end

    def new_move_positions(position)
        p @considered_positions.concat(KnightPathFinder.valid_moves(position).reject{ |move| @considered_positions.include?(move) })
    end
end

kpf = KnightPathFinder.new([0, 0])
kpf.new_move_positions([0,0])