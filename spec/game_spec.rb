require 'game' 

describe Game do 
	
	let(:player1) {double :player1, name: "Mihai"}
	let(:player2) {double :player1, name: "Tim"}
	let(:game){Game.new([player1, player2])}

	context 'before playing' do

		it 'can be initialized with no players' do
			game = Game.new
			expect(game).not_to(have_players)
		end

		it 'can add players to the game' do
			new_game = Game.new
			expect(new_game.add(player1)).to(have_players)
		end

		it 'has two players' do
			expect(game.players).to eq([player1, player2])
		end

		it 'knows the number of players' do
			expect(game.player_count).to eq(2)
		end

		it 'cannot add more than two players' do
			game.add(double :player)
			expect(game.player_count).to eq(2)
		end

		it 'knows if a game is ready' do
			expect(game).to(have_enough_players)
		end

	end

	context 'selecting players' do

		it 'can select a player based on their name' do
			expect(game.select_player_called("Mihai")).to eq(player1)
		end

		it 'can select the players opponent based on players name' do
			expect(game.select_opponent_of("Mihai")).to eq(player2)
		end

	end

	context 'when playing' do

		it 'player one picks rock, player two picks scissors' do
			allow(player1).to receive(:pick) { "Rock" }
			allow(player2).to receive(:pick) { "Scissors" }
			expect(game.winner).to eq(player1)
		end

		it 'player one picks paper, player two picks scissors' do
			allow(player1).to receive(:pick) { "Paper" }
			allow(player2).to receive(:pick) { "Scissors" }
			expect(game.winner).to eq(player2)
		end

		it 'can be a draw, both players picked "Lizard"' do
			allow(player1).to receive(:pick) { "Lizard" }
			allow(player2).to receive(:pick) { "Lizard" }
			expect(game.winner).to eq("Draw")
		end

	end

end