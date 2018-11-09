# Sudoku puzzle Solver

Sudoku puzzle solver written in ruby.

It takes 81-byte Sudoku strings as input, and solves them with backtracking.

# To run the puzzle solver

Use your 81-byte Sudoku Strings or use the below example Strings.

    $ ./runner <string>

The solver will output the input provided by user as a chart, and the solution as a 81-byte string and a chart.

### Example:

    $ ./runner 806100000000080090500700400002001005060050901015004000704000000000368200080000500
    Input:
    8 . 6 | 1 . . | . . .
    . . . | . 8 . | . 9 0
    5 . . | 7 . . | 4 . .
    ------+-------+------
    . . 2 | . . 1 | . 0 5
    . 6 . | . 5 . | 9 . 1
    . 1 5 | . . 4 | . . .
    ------+-------+------
    7 0 4 | . . . | . . .
    . . . | 3 6 8 | 2 . .
    . 8 . | . . . | 5 0 .

    Solution:
    836149752247583196591726438472691385368257941915834627724915863159368274683472519
    8 3 6 | 1 4 9 | 7 5 2
    2 4 7 | 5 8 3 | 1 9 6
    5 9 1 | 7 2 6 | 4 3 8
    ------+-------+------
    4 7 2 | 6 9 1 | 3 8 5
    3 6 8 | 2 5 7 | 9 4 1
    9 1 5 | 8 3 4 | 6 2 7
    ------+-------+------
    7 2 4 | 9 1 5 | 8 6 3
    1 5 9 | 3 6 8 | 2 7 4
    6 8 3 | 4 7 2 | 5 1 9


# To run the tests

    $ ruby sudoku_test.rb
