require_relative "poly_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(position)

    end

    def initialize(starting_position = [0,0])
        @root_node = PolyTreeNode.new(starting_position)
        @considered_positions = [starting_position]
    end

    def build_move_tree
        #@root_node
    end

    def new_move_positions(position)
        moves = self.valid_moves(position)
    end

    # def find_path(ending_position)
    # end

end
