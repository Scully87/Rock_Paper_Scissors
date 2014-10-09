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
    p session.inspect
    session[:type] = params[:type]
    erb :new_player
  end

  post '/register' do 
    p session.inspect
    session[:player] = Player.new(params[:name])
    GAME.add session[:player]
    GAME.add computer #if single_player_mode?
    redirect to '/play_game' #if  GAME.has_enough_players? #single_player_mode? ||
    #redirect to '/waiting'
  end

  # get '/waiting' do
  #   redirect to '/play' if GAME.has_enough_players?
  #   erb :waiting
  # end

  get '/play_game' do
    p session.inspect
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    erb :play_game
  end

  post '/play_game' do
    p session.inspect
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    @opponent.random_pick if single_player_mode?
    @player.pick = params[:pick]
    redirect to '/waiting_on_opponent'
  end

  get '/waiting_on_opponent' do
    @opponent = GAME.select_opponent_of session[:player].name
    redirect to '/results' if @opponent.has_picked?
    #erb :opponent_pick
  end

  get '/results' do
    p session.inspect
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    erb :results
  end

  get '/play_again' do
    p session.inspect
    @player = GAME.select_player_called session[:player].name
    @opponent = GAME.select_opponent_of session[:player].name
    @player.reset_pick
    redirect to '/play_game' if !@opponent.has_picked? || single_player_mode?
    #redirect to '/waiting_to_play'
  end

  # get '/waiting_to_play' do
  #   @opponent = GAME.select_opponent_of session[:player].name
  #   redirect to '/' unless GAME.has_enough_players?
  #   redirect to '/play_game' unless @opponent.has_picked?
  #   #erb :waiting_to_play
  # end

  get '/game_over' do
    p session.inspect
    session[:player] = nil
    session[:type] = nil
    GAME.reset
    redirect to '/'
  end

  def computer
    Player.new
  end

  def single_player_mode?
    p session.inspect
    session[:type] == "single"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
