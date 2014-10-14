class Game 

	def initialize(players = [])
		@players = players
	end

	BEATS = { scissors: :paper,
						paper: :rock,
						rock: :lizard,
						lizard: :spock,
						spock: :scissors,
						scissors: :lizard,
						lizard: :paper,
						paper: :spock,
						spock: :rock,
						rock: :scissors
		 		 	}

	attr_reader :players, :player1, :player2

	def set_players
		@player1 = players.at(0)
		@player2 = players.at(1)
	end

	def winner
		set_players
		return "Draw" if player1.pick == player2.pick
		return player1  if BEATS[normalize(player1.pick)] == normalize(player2.pick)
		player2
	end

	def normalize(pick)
		pick.downcase.to_sym
	end

	def player_count
		players.count
	end

	def has_players?
		players.any?
	end

	def add(player)
		players << player unless has_enough_players?
		self
	end

	def select_player_called(name)
		players.select{ |player| player.name == name }.at(0)
	end

	def select_opponent_of(name)
		players.reject{ |player| player.name == name }.at(0)
	end

	def has_enough_players?
		player_count == 2
	end

	def reset
		@players = []
	end
end