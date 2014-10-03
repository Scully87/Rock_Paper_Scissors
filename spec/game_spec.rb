require 'game'

describe Game do  

  let(:player1) {double :player1, name: "Johnson"}
  let(:player2) {double :player2, name: "Jason"}
  let(:game) {Game.new([player1, player2])}

  it "has two players" do
  	expect(game.players).to eq [player1, player2]
  end

end