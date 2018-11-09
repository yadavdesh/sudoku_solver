require "test/unit"

require_relative "../lib/sudoku"

class TestSolver < Test::Unit::TestCase
  def test_simple
    puzzle = Sudoku::Puzzle.from_s("008020015105003402042075300000280539483900200250607800091300027804700053300592080")
    solver = Sudoku::Solver.new
    solution = solver.solve(puzzle)
    correct = "638429715175863492942175368716284539483951276259637841591348627824716953367592184"
    assert_equal(correct, solution.to_s)
  end

  def test_complex
    puzzle = Sudoku::Puzzle.from_s("830040000000600002400015300500020000000008701360000080005000600008100050000002004")
    solver = Sudoku::Solver.new
    solution = solver.solve(puzzle)
    correct = "836249517159673842472815396581726439924358761367491285715934628248167953693582174"
    assert_equal(correct, solution.to_s)
  end

  def test_validity
    data = "836249517159673842472815396581726439924358761367491285715934628248167953693582174"
    puzzle = Sudoku::Puzzle.from_s(data)
    solver = Sudoku::Solver.new
    solution = solver.solve(puzzle)
    assert_equal(data, solution.to_s)
  end
end
