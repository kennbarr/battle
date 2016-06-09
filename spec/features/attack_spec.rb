require 'spec_helper'

feature "attacking players" do
	scenario "player 1 is attacking player 2" do
		sign_in_and_play
		click_link 'ATTACK!!!'
		expect(page).to have_content "name1 attacks name2"
	end
end

feature "reducing player's points" do
	scenario 'player 1 reduces player\'s 2 points by 10 ' do 
		sign_in_and_play
		click_link  'ATTACK!!!'
		# expect(page).to have_content "name2 lost 10 points"
		# expect(player_2_hit_points).to 
	end
end