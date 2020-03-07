require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_nodes = []
    (0...@board.rows.length).each do |row_n|
      (0...@board.rows[row_n].length).each do |col_n|
        pos = [row_n,col_n]
        if @board.empty?(pos)
          child_board = @board.dup
          child_board[pos] = @next_mover_mark
          child_mark = (@next_mover_mark == :x)? :o : :x
          
          child_nodes << TicTacToeNode.new(child_board, child_mark, pos)
        end
      end
    end
    
    child_nodes
  end

  def losing_node?(evaluator)
    return @board.won? && @board.winner != evaluator if @board.over?
    
    if @next_mover_mark == evaluator 
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      self.children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    return @board.winner == evaluator if @board.over?

    if @next_mover_mark == evaluator
      self.children.any? { |node| node.winning_node?(evaluator) }
    else
      self.children.all? { |node| node.winning_node?(evaluator) }
    end
  end
end
