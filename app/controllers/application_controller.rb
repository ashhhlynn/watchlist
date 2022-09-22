require './config/environment'
require 'sinatra'
require 'sinatra/activerecord'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "watchlist"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    
  def current_user 
  User.find_by(id: session[:user_id])
  end

  def logged_in?
  !!current_user
  end

  end 

end
