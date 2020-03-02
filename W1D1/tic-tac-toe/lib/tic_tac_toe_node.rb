require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_nodes = []
    (0...@board.rows.length).each do |row_n|
      (0...@board.rows[row_n].length).each do |col_n|
        if @board.empty?([row_n,col_n])
          child_mark = (@next_mover_mark == :x)? :o : :x
          child_board = @board.dup
          child_board.rows.each_with_index do |row,row_n|
            row.each_with_index do |col,col_n|
              child_board.rows[row_n][col_n] = child_mark
            end
          end
          child_nodes << TicTacToeNode.new(child_board, child_mark, [row_n,col_n])
        end
      end
    end
    
    child_nodes
  end

  def losing_node?(evaluator)
  end

  def wining_node?(evaluator)
  end
end

t = TicTacToeNode.new(Board.new,:x)
t.children
