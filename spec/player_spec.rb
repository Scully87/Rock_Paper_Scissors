require 'player'

describe Player do 

	let(:player) {Player.new("Mihai")}
	let(:computer) {Player.new("Computer")}
	
	context 'whilst being named' do

		it 'has a name' do
			expect(player.name).to eq("Mihai")
		end

		it 'has a computer if created with no name' do
			expect(computer.name).to eq("Computer")
		end

	end
	
	context 'whilst making picks' do

		it 'can make a pick' do 
			player.pick = ("Rock")
			expect(player.pick).to eq("Rock")
		end

		it 'has not picked when created' do
			expect(player).not_to(have_picked)
		end

		it 'knows when a player has picked' do
			player.pick = ("Rock")
			expect(player).to(have_picked)
		end

	end
		
end