require 'sinatra/base'
require './lib/play'

class RockPaperScissors < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_name] = params[:player_name]
    redirect '/play'
  end

  get '/play' do
    @player_name = session[:player_name]
    @player_pick = session[:player_pick]
    @computer_pick = session[:computer_pick]
    @result = session[:result]
    erb :play
  end

  post '/selection' do
    # binding.irb
    session[:player_pick] = params[:selection]
    play = Play.new
    computer_move = play.computer
    session[:computer_pick] = computer_move
    session[:result] = play.play(session[:player_pick], computer_move)

    redirect '/play'
  end
end