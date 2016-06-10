require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  #enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    Game.create(Player.new(params[:player_1_name]),Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/play' do
    @player_1_name = Game.game.player1.name
    @player_2_name = Game.game.player2.name
    @player_1_hit_points = Game.game.player1.hit_points
    @player_2_hit_points = Game.game.player2.hit_points
    if Game.game.current_player == Game.game.player1
      @disable_player2 = "disabled"
      @disable_player1 = ""
      @current_player = @player_1_name
    else
      @disable_player1 = "disabled"
      @disable_player2 = ""
      @current_player = @player_2_name
    end
    if Game.game.player1.hit_points == 0 || Game.game.player2.hit_points == 0
      @disable_player1 = "disabled"
      @disable_player2 = "disabled"
    end
    erb :play
  end

  post '/attack' do
    if params[:target] == "player_1"
      Game.game.attack(Game.game.player1)
    elsif params[:target] == "player_2"
      Game.game.attack(Game.game.player2)
    end
    redirect '/play'
  end



  #start the server if ruby file executed directly
  run! if app_file == $0
end
