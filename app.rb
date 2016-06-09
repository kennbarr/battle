require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  #enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_1_hit_points = $player_1.hit_points
    @player_2_hit_points = $player_2.hit_points
    erb :play
  end

  get '/attack' do
    game = 
    p '-'
    p params[:target] 
    p '-'
    if params[:target] == "player_1"
      Game.new.attack($player_1)
    elsif params[:target] == "player_2"
      Game.new.attack($player_2)
    end
    # @player_1_name = $player_1.name
    # @player_2_name = $player_2.name
    # erb :attack
    redirect '/play'
  end



  #start the server if ruby file executed directly
  run! if app_file == $0
end
