require 'sinatra/base'

class Rock_Paper_Scissors < Sinatra::Base

  set :views, Proc.new{File.join(root, '..', "views")}

  enable :sessions

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
    GAME.add computer if single_player_mode?
  	redirect to '/play' if single_player_mode? || GAME.has_enough_players?
    redirect to '/waiting'
  end









  # start the server if ruby file executed directly
  run! if app_file == $0
end
