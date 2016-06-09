require 'game'

describe Game do

	subject(:game) {described_class.new}
	let(:player1) {double :player, hit_points: 50}
	let(:player2) {double :player, hit_points: 50}

	describe "#attack" do
		it 'reduces opponents hp' do
			expect(player2).to receive(:got_attacked)
			game.attack(player2)
		end
	end

end