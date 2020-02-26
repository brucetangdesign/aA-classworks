
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

    def dfs(target_value)
        return nil if self == nil
        return self if self.value == target_value
        @children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result == nil
        end

        nil
    end

    def get_children
        @children.map {|child| child.value}
    end
end

n1 = PolyTreeNode.new(1)
n2 = PolyTreeNode.new(2)
n2a = PolyTreeNode.new("2a")
n3 = PolyTreeNode.new(3)

n1.add_child(n2)
n1.add_child(n3)
n2.add_child(n2a)
p n1.dfs("4")