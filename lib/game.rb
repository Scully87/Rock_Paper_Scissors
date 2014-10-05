class Game

 	def intialize
	  @player_one = nil
	  @player_two = nil  
	end

	def players
	  [@player_one, @player_two]
	end

	def add_player(player)
      return @player_two = player unless has_player?
		     @player_one = player
	end

	def has_player?
	  @player_one.nil?
	end

# game = Game.new
# p game
# game.add_player :Tim
# p game
# game.add_player :John
# p game
# p game.players
end