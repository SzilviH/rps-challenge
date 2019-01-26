require 'sinatra/base'
require './lib/player'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name_weapon' do
    session[:player] = Player.new(params[:player])
    session[:weapon] = params[:weapon]
    redirect '/play'
  end

  get '/play' do
    @player = session[:player]
    @weapon = session[:weapon]
    erb :play
  end

  run! if app_file == $0
end
