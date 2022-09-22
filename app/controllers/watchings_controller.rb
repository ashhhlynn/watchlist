class WatchingsController < ApplicationController

get '/watchings' do
    @watchings = Watching.all  
    erb :'watchings/index'
end    

get '/watchings/new' do 
    if logged_in?
    erb :'watchings/new'
    else 
    redirect '/watchings'
end
end 

post '/watchings' do
if params[:watching][:title] == "" || params[:watching][:image_url] == "" || params[:watching][:movie_or_show] == "" || params[:watching][:streaming_location] == ""
erb :'watchings/new'
else 
    @watching = Watching.new(params[:watching]) #' new or create?'
    @watching.creator_id = current_user.id
    @watching.save #'do I need that?'
    redirect '/watchings'
end 
end 


get '/watchings/:id' do 
@watching = Watching.find_by(id: params[:id])
@add = @watching.adds.find_by(user_id: current_user.id)
erb :'watchings/show'
end


    get '/watchings/:id/edit' do
    @watching = Watching.find_by(id: params[:id])
    if @watching.creator_id == current_user.id
    erb :'watchings/edit'
    else 
    redirect '/watchings'
    end   
    end 

    patch '/watchings/:id' do
    @watching = Watching.find_by(id: params[:id])
    if params[:watching][:title] != "" && params[:watching][:image_url] != "" && params[:watching][:movie_or_show] != "" && params[:watching][:streaming_location] != ""
    @watching.update(params[:watching])
    redirect "/watchings/#{@watching.id}"
    else 
    erb :'watchings/edit'
    end 
    end 
        
    delete '/watchings/:id/delete' do
    @watching = Watching.find_by(id: params[:id])
    if @watching.creator_id == current_user.id
    @watching.destroy
    redirect to '/watchings'
    end    
end 

end 