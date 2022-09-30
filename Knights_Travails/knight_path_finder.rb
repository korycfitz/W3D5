require_relative "poly_tree_node.rb"

class KnightPathFinder
    attr_reader :considered_positions

    def self.valid_moves(position)
        row, col = position
        changes = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
        new_moves = []
        changes.each do |change|
            row_change, col_change = change
            new_row = row + row_change
            new_col = col + col_change
            if new_row >= 0 && new_row < 8
                new_moves << [new_row, new_col] if new_col >= 0 && new_col < 8
            end
        end
        new_moves
    end

    def initialize(starting_position = [0,0])
        @root_node = PolyTreeNode.new(starting_position)
        @considered_positions = [starting_position]
    end

    def build_move_tree
        #@root_node
    end

    def new_move_positions(position)
        moves = KnightPathFinder.valid_moves(position)
        moves.reject! {|move| @considered_positions.include? move }
        @considered_positions += moves
        moves
    end

    # def find_path(ending_position)
    # end

end

test = KnightPathFinder.new([0,3])
p KnightPathFinder.valid_moves([0,3])
p test.new_move_positions([3,4])
p test.considered_positions