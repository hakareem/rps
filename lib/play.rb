class Play
  def computer
    ["Rock", "Paper", "Scissors"].sample
  end

  def play(move, computer_move)
    win_condition = {
      'Rock' => 'Paper',
      'Paper' => 'Scissors',
      'Scissors' => 'Rock',
    }
    # binding.irb

    if win_condition[move] == computer_move
      "Lose"
    elsif move == computer_move
      "Draw"
    else
      "Win"
    end
  end
end

# game = Play.new
# game.play("Rock", "Paper")