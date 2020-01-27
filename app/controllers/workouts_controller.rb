class WorkoutsController < ApplicationController

    get '/workouts/new' do
        erb :'/workouts/new'
    end 
        
    post '/workouts' do 
    workout = current_user.workouts.build(params)
    if workout.save
    redirect 'workouts'
    else
        @error = "No data entered. Please try again."
        erb :'/workouts/new'
    end
end 
    
    get '/workouts' do
        @workout = Workout.all
        erb :'workouts/index'
    end 

    get '/workouts/:id' do
       @workout = Workout.find_by(id: params[:id])
        if @workout
          erb :'workouts/edit'     
        else 
            redirect '/workouts'
        end    
    end 
    
    delete '/workouts/:id' do 
        workout = Workout.find(params[:id]) 
        workout.destroy 
        redirect '/workouts'
        end 
    end 