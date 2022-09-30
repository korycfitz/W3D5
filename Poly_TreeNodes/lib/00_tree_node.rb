require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_node)
        # debugger
        @parent = parent_node
        # debugger
        parent_node.children << self if parent_node
        # debugger
    end
end