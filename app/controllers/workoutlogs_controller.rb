class WorkoutlogController < ApplicationController
require 'sinatra'
require 'pry'

get '/workoutlogs/new' do
    @workouts = Workout.all
    erb :'/workoutlogs/new'

end 
    
post '/workoutlogs' do
    workoutlog = current_user.workoutlogs.build(params)
    workout_ids = Workout.find_or_create_by(id: params[:id])
    binding.pry
    workoutlog.workouts << workout_ids
     if workoutlog.save 
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
    @workoutlog.update(params["workoutlog"])
    redirect "/workoutlogs"
    else 
        @error = "Fields must not be empty. Please try again"
        erb :'/workoutlogs/edit'
    end     
end 


delete '/workoutlogs/:id' do 
 workoutlog = Workoutlog.find(params[:id])
  workoutlog.destroy 
    redirect '/workoutlogs'
    end 
end 