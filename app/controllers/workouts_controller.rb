class WorkoutsController < ApplicationController

    get '/workouts/new' do
        erb :'/workouts/new'
    end 
        
    post '/workouts' do 
        workout = current_user.workouts.build(params)
        if workout.save
            redirect '/workouts'
        else 
            @error = "No data entered. Please try again."
            erb :'/workouts/new '
        end
    end 
    
    get '/workouts' do
        @workout = Workout.all
        
        erb :'workouts/index'
    end 
    
    #Show
        #make a get request to '/workouts/:id' ()
    
    get '/workouts/:id/edit' do
       #binding.pry
       @workout = Workout.find_by(id: params[:id])
        if @workout
          erb :'workouts/show'     
        else 
            redirect '/workouts'
        end    
    end 
    
    
    # Destroy
    # make a delete request to '/recipes/id'
    delete '/workouts/:id' do 
        workout_log = Workoutlog.find(params[:id])
        workout_log.destroy 
        redirect '/workouts'
        end 
    end 