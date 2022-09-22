class WatchingsController < ApplicationController

get '/watchings' do
    @watchings = Watching.all  
    erb :'watchings/index'
end    

get '/watchings/:id' do 
    @watching = Watching.find_by(id: params[:id])
    erb :'watchings/show'
end




end 