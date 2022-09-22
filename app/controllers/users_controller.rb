class UsersController < ApplicationController

    get '/login' do 
    if !logged_in? 
    erb :'users/login'
    else 
    redirect "/users/#{current_user.id}"
    end 
    end 
        
        post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            erb :'users/login'
        end
        end

        get '/logout' do 
        if logged_in?
        session.clear
        redirect "/"
            end
        end
    
    get '/users' do 
    @users = User.all 
    erb :'users/index'
    end

    get '/users/:id' do 
    @user = User.find_by(id: params[:id])
    @user_adds = @user.adds
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
    else
        erb :'users/signup'
    end 
    end 

    get '/users/:id/edit' do 
    @user = User.find_by(id: params[:id])
    if current_user == @user
    erb :'users/edit'
    else 
    redirect "/users"
    end 
    end 
        
    patch '/users/:id/edit' do 
    @user = User.find_by(id: params[:id])
    @user.update(params[:user])
    redirect "/users/#{@user.id}"
    end
    
    delete '/users/:id/delete' do 
    @user = User.find_by(id: params[:id])
    if current_user == @user
    @user.destroy
    redirect "/users"
    end 
    end







end 

