def sign_in_and_play
  visit '/'
    fill_in :player_1_name, with:  'name1'
    fill_in :player_2_name, with:  'name2'
    click_button 'Submit'
end
