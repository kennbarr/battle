require 'spec_helper'

feature "fill in players names" do
  scenario "players enter their names" do
    sign_in_and_play
    expect(page).to have_content "name1 vs name2"
  end
end

feature "viewing players hit points" do
  scenario "view player 2 hit points" do
    sign_in_and_play
    expect(page).to have_content "name2 has 50 points"
  end
end

feature "lose screen shows if player loses" do
  scenario "player 2 at 0 hp" do
    sign_in_and_play
    4.times do
      click_button "ATTACK!!! name2"
      click_button "ATTACK!!! name1"
    end
    click_button "ATTACK!!! name2"
    expect(page).to have_content "name2 loses!"
  end
end
