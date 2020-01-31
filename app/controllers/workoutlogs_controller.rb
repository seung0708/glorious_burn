class WorkoutlogController < ApplicationController
require 'sinatra'
require 'pry'

get '/workoutlogs/new' do
    @workout = Workout.all
    erb :'/workoutlogs/new'

end 
    
post '/workoutlogs' do
    @workout = Workout.all
    @workoutlog = current_user.workoutlogs.build(params[:workoutlog])
    @workoutlog.workout == Workout.find(params[:workoutlog][:workout_id])
       if  @workoutlog.save 
         redirect '/workoutlogs'
       else
         @error = "No data entered. Please try again."
         redirect '/workoutlogs/new'  
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

get '/workoutlogs/:id' do
    @workoutlogs = Workoutlog.find(params[:id])
    erb :'/workoutlogs/show'
end

get '/workoutlogs/:id/edit' do
    @workoutlog = Workoutlog.find_by(params[:id])
     erb :'workoutlogs/edit'        
end

patch '/workoutlogs/:id' do 
    @workoutlog = Workoutlog.find(params[:id])
    filtered_params = Workoutlog.includes(:workout).where('workout.name = ?', 'params[:name]').references(:workout)
    if @workoutlog.update(filtered_params)
    redirect "/workoutlogs"
    else @error = "Fields must not be empty. Please try again"
        erb :'/workoutlogs/edit'
    end     
end 


delete '/workoutlogs/:id' do 
    workoutlog = Workoutlog.find(params[:id])
    workoutlog.destroy 
    redirect '/workoutlogs'
end 

end 