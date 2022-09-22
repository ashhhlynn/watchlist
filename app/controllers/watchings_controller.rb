class WatchingsController < ApplicationController

get '/watchings' do
    @watchings = Watching.all  
    erb :'watchings/index'
end    

get '/watchings/:id' do 
    @watching = Watching.find_by(id: params[:id])
    erb :'watchings/show'
end

get '/watchings/new' do 
    erb :'watchings/new'
    end

post '/watchings' do
    if params[:watching][:title] == "" || params[:watching][:image_url] == "" || params[:watching][:movie_or_show] == "" || params[:watching][:streaming_location] == ""
        erb :'watchings/new'
    else     
        @watching = Watching.create(params[:watching])
        @watching.creator_id = current_user.id
        @watching.save #'do I need that?'
        redirect '/watchings'
    end 
    end 

    get '/watchings/:id/edit' do
    @watching = Watching.find_by(id: params[:id])
    erb :'watchings/edit'
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
    @watching.destroy
    redirect to '/watchings'
    end    

end 