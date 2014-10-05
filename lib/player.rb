class Player

  def initialize(name: 'Defualt Name')
  	@name = name
  end

  attr_reader :name

  player = Player.new

  p player

end