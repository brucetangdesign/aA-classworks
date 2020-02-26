
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

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Error: #{child_node.value} is not a child of this node" if !@children.include?(child_node)
        child_node.parent = nil
    end
end