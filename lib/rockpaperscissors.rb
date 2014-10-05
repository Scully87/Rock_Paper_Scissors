# require 'game'
# require 'player'
require 'sinatra/base'

class Rock_Paper_Scissors < Sinatra::Base

  set :views, Proc.new{File.join(root, '..', "views")}

  enable :sessions

  # GAME = Game.new

  get '/' do
    puts session.inspect
    erb :index
  end

  get '/game/single' do
    puts session.inspect
  	erb :new_player
  end

   get '/game/versus' do 
    puts session.inspect
  	erb :player2
   end

  post '/register_single' do
    puts session.inspect
    @name = params[:player_name]
  	session[:single] = params[:player_name]
  	erb :game 
  end

  post '/register_versus' do
    puts session.inspect
    @name1 = params[:player_1_name]
    @name2 = params[:player_2_name]
    session[:versus] = []
    session[:versus] = [@name1, @name2]
    erb :game
  end











  # start the server if ruby file executed directly
  run! if app_file == $0
end
