require 'player'

describe Player do 

	let(:player) { Player.new }

  it "has a name" do
		expect(player.name).to eq @name
  end

end