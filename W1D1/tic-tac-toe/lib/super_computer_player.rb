require_relative 'tic_tac_toe_node'

#In the #move method, build a TicTacToeNode from the board stored in the game passed in as an argument. Next, iterate through the children of the node we just created.
#If any of the children is a winning_node? for the mark passed in to the #move method, return that node's prev_move_pos because that is the position that causes a certain victory! I told you we would use that later!

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    winning_move = nil
    node.children.each do | child_node | 
      winning_move = child_node.prev_move_pos if child_node.winning_node?(mark)
    end

    return winning_move if winning_move != nil

    non_losing_children = node.children.select {|child_node| !child_node.losing_node?(mark) }
    return non_losing_children.sample.prev_move_pos

    raise "Wait, it looks like I'm going to lose?"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
