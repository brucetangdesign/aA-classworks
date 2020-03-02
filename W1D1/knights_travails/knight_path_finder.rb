require_relative "poly_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        build_move_tree
    end

    def build_move_tree
        start_pos = @root_node
        
        queue = []
        queue << start_pos
        100.times do #until queue.empty?
            search_result = queue.shift
            if search_result != nil
            new_move_positions(search_result.value).each do | position |
                if position != search_result.value
                    new_node = PolyTreeNode.new(position)
                    search_result.add_child(new_node)
                    queue << new_node
                end
            end
            end
        end
        p @considered_positions
    end

    def self.valid_moves(position)
        grid_size = 8
        valid_moves = []
        row, col = position

        start_row = row > 1 ? row - 2 : row
        end_row = row + 2 < (grid_size-1) ? row + 2 : row
        start_col = col > 0 ? col - 1 : col + 1

        if start_row < grid_size
            (start_row..end_row).step(2).each do |cur_row|
                if cur_row != row
                    #find one left and one right
                        valid_moves << [cur_row,col-1] if col-1 > 0
                        valid_moves << [cur_row,col+1] if col+1 < grid_size-1
                else
                    col_before = col - 2
                    col_after = col + 2
                    # in same row we move over 2 cols and up and down 1 row
                    if row - 1 > 0
                        valid_moves << [row-1,col_before] if col_before > 1
                        valid_moves << [row-1,col_after] if col_after < grid_size - 1
                    end

                    if row + 1 <= grid_size-1
                        valid_moves << [row+1,col_before] if col_before > 1
                        valid_moves << [row+1,col_after] if col_after < grid_size - 1
                    end
                end
            end
        end
        valid_moves
    end

    def new_move_positions(position)
        new_positions = KnightPathFinder.valid_moves(position).reject{ |move| @considered_positions.include?(move) }
        @considered_positions.concat(new_positions)
        new_positions
    end

    def find_path(end_position)
        
    end
end

kpf = KnightPathFinder.new([0, 0])