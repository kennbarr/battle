require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  #enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1_name]),Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $game.player1.name
    @player_2_name = $game.player2.name
    @player_1_hit_points = $game.player1.hit_points
    @player_2_hit_points = $game.player2.hit_points
    erb :play
  end

  get '/attack' do
    if params[:target] == "player_1"
      $game.attack($game.player1)
    elsif params[:target] == "player_2"
      $game.attack($game.player2)
    end
    redirect '/play'
  end



  #start the server if ruby file executed directly
  run! if app_file == $0
end
