
class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(new_node)
        @value = new_node
        @parent = nil
        @children = []
    end

    def parent=(parent)
        @parent.children.delete(self) if @parent != nil
        @parent = parent
        if @parent != nil
            @parent.children << self if !@parent.children.include?(self)
        end
    end
end