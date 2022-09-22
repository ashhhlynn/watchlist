class UsersController < ApplicationController
    
    get '/users' do 
    @users = User.all 
    erb :'users/index'
    end

    get '/users/:id' do 
    @user = User.find_by(id: params[:id])
    erb :'users/show'
    end    
    
    get '/signup' do
    erb :'users/signup'
    end

    post '/users' do 
    if params[:user][:username] != "" && params[:user][:name] != "" && params[:user][:password] != ""
    @user = User.new(params[:user])
        if @user.save
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
        end
        erb :'users/signup'
        end 
    end 

end 

