require_relative 'tic_tac_toe_node'

#In the #move method, build a TicTacToeNode from the board stored in the game passed in as an argument. Next, iterate through the children of the node we just created.

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)

    
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
