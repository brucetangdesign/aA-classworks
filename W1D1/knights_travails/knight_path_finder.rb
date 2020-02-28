require_relative "poly_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        build_move_tree
    end

    def build_move_tree

    end
end

kpf = KnightPathFinder.new([0, 0])