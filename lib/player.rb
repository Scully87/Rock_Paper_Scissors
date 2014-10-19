class Player

  def initialize(name = "computer")
  	@name = name
  	@picked = false
  end

  attr_reader :name, :pick

  def pick=(value)
    @pick = value
	  @picked = true
    self
  end

  def random_pick
	  @pick = ["Paper", "Rock", "Scissors", "Lizard", "Spock"].sample
	  @picked = true
    self
  end

  def has_picked?
	  @picked
  end

  def reset_pick
	  @picked = false
	  @pick = nil
  end

end