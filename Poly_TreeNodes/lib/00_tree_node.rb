require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_node)
        if @parent != nil
            if @parent.children.include?(self)
                @parent.children.reject! { |ele| ele == self }
            end
        end
        @parent = parent_node
        parent_node.children << self if parent_node
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise "Not a child" if !@children.include?(child_node)
        child_node.parent=nil
    end

    def dfs(target_value)
        # debugger
        return self if self.value == target_value
        # debugger
        children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)

    end

end



n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")

# connect n3 to n1
n3.parent = n1
# connect n3 to n2
n3.parent = n2

# this should work
raise "Bad parent=!" unless n3.parent == n2
raise "Bad parent=!" unless n2.children == [n3]
raise "Bad parent=!" unless n1.children == []
