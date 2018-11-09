require_relative 'puzzle'

module Sudoku
  class Solver

    # Recursive solution using backtracking
    #
    # @params puzzle [Puzzle] input puzzle
    # @return [Puzzle] the solved puzzle
    # @return [nil] if there is no solution
    def solve(puzzle)

      # If there is still a blank field, try all possible
      # candidates (numbers) for the field
      if blank = puzzle.first_blank_index
        puzzle.candidates(blank).each do |candidate|

          # Create a clone of the puzzle with the candidate number set
          new_puzzle = puzzle.make_copy
          new_puzzle[blank] = candidate

          if solution = solve(new_puzzle)
            return solution
          end
        end

        # None of the candidates was a correct solution, backtrack
        return nil

      # No blank field anymore
      else
        if puzzle.solved?
          # puzzle is solved, return it
          return puzzle
        else
          # no possible solution
          return nil
        end
      end
    end
  end
end
