class WorkoutlogController < ApplicationController

get '/workoutlogs/new' do
    erb :'/workoutlogs/new'
end 
    
post '/workoutlogs' do 
    log = current_user.workoutlogs.build(params)
    if log.save
        redirect '/workoutlogs'
    else
        @error = "No data entered. Please try again."
        erb :'/workoutlogs/new'
    end
end 

get '/workoutlogs' do
    if logged_in?
        @workoutlog = Workoutlog.all
        erb :'workoutlogs/index'
    else 
        erb :'workoutlogs'
    end
end 

#Show
    #make a get request to '/workouts/:id' ()

get '/workoutlogs/:id' do
    #binding.pry
   @workoutlog = Workoutlog.find_by(id: params[:id])
   if @workoutlog 
     erb :'workoutlogs'    
   else 
      redirect '/workoutlogs'
    end    
end 


# Destroy
# make a delete request to '/recipes/id'
delete '/workoutlogs/:id' do 
    workoutlog = Workoutlog.find(params[:id])
    workoutlog.destroy 
    redirect '/workoutlogs'
    end 
end 