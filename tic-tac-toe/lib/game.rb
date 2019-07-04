class Game
  def initialize
    @board = "1|2|3\n4|5|6\n7|8|9\n"
    puts @board
  end

  def move(position)
    board_update = @board.chars.map! { |item|
      if item == position.to_s
        item = 'X'
      else
        item
      end
      }
    puts board_update.join
  end
end
