require 'spec_helper'

feature "attacking players" do
	scenario "player 1 is attacking player 2" do
		sign_in_and_play
		click_button 'ATTACK!!! name2'
		expect(page).to have_content "name2 has 40 points"
	end
end
