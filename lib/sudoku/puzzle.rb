require_relative 'parseboard'

module Sudoku


  # Class to store and validate puzzles values

  # Data is stored and accessed as a 1D array

  class Puzzle
    include Parseboard

    attr_accessor :numbers

    # Initialize with an array of numbers
    # Data will be be stored and used as an array

    def initialize(numbers = [])
      @numbers = numbers
    end

    # Create a new instance from a 81-byte sudoku string of numbers.

    # From top left to bottom right. Blanks need to be 0's
    # @param sudoku_string [String] 81-byte string of all the numbers
    # @return [Puzzle] new Puzzle instance


    def self.from_s(sudoku_string)
      if sudoku_string =~ /^\d{81}$/
        numbers = sudoku_string.split("").map(&:to_i)
        Puzzle.new(numbers)
      else
        raise "Input string is not properly formatted"
      end
    end

    # Clone an instance with a deep copy of the numbers

    # @return [Puzzle] copy of the puzzle
    def make_copy
      Puzzle.new(@numbers.dup)
    end

    # Get number at field index i

    # @return [Integer] number at field index
    def [](i)
      @numbers[i]
    end

    # Set a given field index i to a new number
    # @param i [Integer] field index
    # @param number [Integer] new value
    # @return [Integer]
    def []=(i, number)
      @numbers[i] = number
    end

    # Find the first field index where no number has set

    # @return [Integer] if found
    # @return [nil] if not found
    def first_blank_index
      @numbers.find_index{|number| number == 0}
    end

    # Find all possible numbers for a given field index
    # Possible numbers are from 1 to 9 excluding all existing
    # numbers in the row, column and box

    # @param i [Integer] field index
    # @return [Array] array of candidate numbers
    def candidates(i)
      (1..9).to_a \
        - unit_data(ROW_INDEXES, INDEX_TO_ROW[i]) \
        - unit_data(COL_INDEXES, INDEX_TO_COL[i]) \
        - unit_data(BOX_INDEXES, INDEX_TO_BOX[i])
    end

    # Test if the sudoku puzzle is solved
    # if yes ==> each boxes, rows and columns sum should be 45

    # @return [Boolean]
    def solved?
      units_fine(BOX_INDEXES) &&
      units_fine(COL_INDEXES) &&
      units_fine(ROW_INDEXES)
    end

    # The puzzle as an 81-byte string
    # @return [String]
    def to_s
      @numbers.map(&:to_s).join
    end

    # The puzzle as a human readable sudoku chart
    # @return [String]
    def to_chart
      chart = ""

      (0..8).each do |i|
        (0..8).each do |j|

          n = @numbers[j + (i*9)].to_s
          n = "." if n == "0"
          chart << n

          if j < 8
            chart << " "
            chart << "| " if j % 3 == 2
          end
        end

        chart << "\n"
        chart << "------+-------+------\n" if i % 3 == 2 and i <8
      end

      chart
    end


    private

    # Check that all units of one type, as specified
    # by a mapper, are fine
    def units_fine(mapper)
      (0..8).all?{|i| unit_fine(unit_data(mapper, i))}
    end

    # Check that one specific unit is fine, i.e.
    # numbers 1-9 exist exactly once, so that they
    # add up to 45
    def unit_fine(unit)
      unit.reduce(:+) == 45
    end

    # Get data from one specific unit i as specified
    # by mapper index (row, col, box)
    def unit_data(mapper, i)
      mapper[i].map{|field_index| @numbers[field_index] }
    end
  end
end
