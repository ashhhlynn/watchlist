class AddsController < ApplicationController

    post '/adds' do 
    @add = Add.create(params[:add])
    redirect "/users/#{current_user.id}"
    end 
    
    patch '/adds/:id' do
    @add = Add.find_by(id: params[:id])
    if @add.user_id == current_user.id
    @add.update(params[:add])
    redirect "/users/#{current_user.id}"
    end
    end
        
    delete '/adds/:id' do
    @add = Add.find_by(id: params[:id])  
    if @add.user_id == current_user.id 
    @add.destroy
    redirect "/users/#{current_user.id}"
    end 
    end 


end 