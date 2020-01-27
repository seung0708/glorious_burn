class WorkoutlogController < ApplicationController

get '/workoutlogs/new' do
    @workouts = Workout.all
    erb :'/workoutlogs/new'

end 
    
post '/workoutlogs' do
    workoutlog = Workoutlog.new(created_at: params["created_at"], sets: params["sets"], reps: params["reps"])
    workoutlog.workout_ids = Workout.find_or_create_by(id: params[:id])
    workoutlog.user = current_user
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
   @workoutlog = Workoutlog.find_by(id: params[:id])
   if @workoutlog.update(created_at: params["created_at"], name: params["name"], sets: params["sets"], reps: params["reps"])
     erb :'workoutlogs'    
   else 
      redirect '/workoutlogs/:id'
    end    
end

delete '/workoutlogs/:id' do 
    workoutlog = Workoutlog.find(params[:id])
    workoutlog.destroy 
    redirect '/workoutlogs'
    end 
end 