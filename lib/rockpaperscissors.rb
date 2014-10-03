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








  # start the server if ruby file executed directly
  run! if app_file == $0
end
