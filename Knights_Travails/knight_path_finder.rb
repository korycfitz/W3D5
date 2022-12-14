require_relative "poly_tree_node.rb"
require "byebug"

class KnightPathFinder
    attr_reader :considered_positions, :starting_position

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
        @starting_position = starting_position
    end

    def build_move_tree(ending_position)
        queue = [@starting_position]
        until queue.empty?
            test_position = queue.shift
            return test_position if test_position == ending_position
            queue += new_move_positions(test_position)
        end
        nil
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
# p KnightPathFinder.valid_moves([0,3])
# p test.new_move_positions([3,4])
# p test.considered_positions
# p test.build_move_tree([7,4])
p test.build_move_tree([0,8])
p test.build_move_tree([0,3])
p test.build_move_tree([2,5])