require "test/unit"

require_relative "../lib/sudoku"

class TestSudokuPuzzle < Test::Unit::TestCase
  SAMPLE = "310004069000000200008005040000000005006000017807030000590700006600003050000100002"
  SAMPLE2 = "392578461486192375175346982857219643234685197961734528613427859749851236528963714"

  def test_from_string_ok
    puzzle = Sudoku::Puzzle.from_s(SAMPLE)
    assert_equal(3, puzzle.numbers[0])
    assert_equal(0, puzzle.numbers[2])
  end

  def test_from_string_fail
    s = "123"
    assert_raise( RuntimeError ) { Sudoku::Puzzle.from_s(s) }
  end

  def test_to_s
    puzzle = Sudoku::Puzzle.from_s(SAMPLE)
    assert_equal(SAMPLE, puzzle.to_s)
  end

  def test_make_copy
    puzzle = Sudoku::Puzzle.from_s(SAMPLE)
    puzzle2 = puzzle.make_copy
    puzzle2[0] = 1
    assert_not_equal(puzzle2[0], puzzle[0])
  end

  def test_first_blank_index
    puzzle = Sudoku::Puzzle.from_s(SAMPLE)
    assert_equal(2, puzzle.first_blank_index)
  end

  def test_candidates
    puzzle = Sudoku::Puzzle.from_s(SAMPLE)
    assert_equal([2,5], puzzle.candidates(2))
  end

  def test_solved_false
    puzzle = Sudoku::Puzzle.from_s(SAMPLE)
    assert_false(puzzle.solved?)
  end

  def test_solved_true
    puzzle = Sudoku::Puzzle.from_s(SAMPLE2)
    assert_true(puzzle.solved?)
  end

  def test_to_chart
    chart_expected = <<-EOF
3 1 . | . . 4 | . 6 9
. . . | . . . | 2 . .
. . 8 | . . 5 | . 4 .
------+-------+------
. . . | . . . | . . 5
. . 6 | . . . | . 1 7
8 . 7 | . 3 . | . . .
------+-------+------
5 9 . | 7 . . | . . 6
6 . . | . . 3 | . 5 .
. . . | 1 . . | . . 2
EOF
    puzzle = Sudoku::Puzzle.from_s(SAMPLE)
    assert_equal(chart_expected, puzzle.to_chart)
  end
end
