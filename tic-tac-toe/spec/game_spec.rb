require 'game'

describe Game do
  it 'board is setup' do
    expect { Game.new }.to output("1|2|3\n4|5|6\n7|8|9\n").to_stdout
  end

  it 'receives input and displays X on board' do
    game = Game.new
    expect { game.move(1) }.to output("X|2|3\n4|5|6\n7|8|9\n").to_stdout
  end
end
