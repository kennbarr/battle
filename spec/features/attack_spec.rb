require 'spec_helper'

feature "attacking players" do
	scenario "player 1 is attacking player 2" do
		sign_in_and_play
		click_link 'ATTACK!!! name1'
		expect(page).to have_content "name1 has 40 points"
	end
end
