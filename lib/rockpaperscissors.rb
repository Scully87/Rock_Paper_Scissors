require 'sinatra/base'
require_relative 'player'
require_relative 'game'

class RockPaperScissors < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views")}
  enable :sessions

  GAME = Game.new

  get '/' do 
    erb :index
  end

  get '/game/:type' do
    session[:type] = params[:type]
    erb :new_player
  end

  post '/register' do 
    session[:player] = Player.new(params[:name])
    GAME.add session[:player]
    GAME.add computer 
    redirect to '/play_game' 
  end

  get '/play_game' do
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    erb :play_game
  end

  post '/play_game' do
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    @opponent.random_pick
    @player.pick = params[:pick]
    redirect to '/results'
  end

  get '/results' do
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    erb :results
  end

  get '/play_again' do
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    @player.reset_pick
    redirect to '/play_game'
  end

  get '/game_over' do
    session[:player] = nil
    session[:type] = nil
    GAME.reset
    redirect to '/'
  end

  def computer
    Player.new
  end

  def single_player_mode?
    session[:type] == "single"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
