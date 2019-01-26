require 'sinatra/base'
require './lib/player'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:player] = Player.new(params[:player])

    redirect '/play'
  end

  get '/play' do
    @player = session[:player]
    erb :play
  end

  post '/player_choice' do
    session[:weapon] = params[:weapon].downcase
    redirect '/weapon'
  end

  get '/weapon' do
    @player = session[:player]
    @weapon = session[:weapon]
    erb :weapon
  end

  run! if app_file == $0
end
