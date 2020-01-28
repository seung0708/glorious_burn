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
        @workout = Workout.find(params[:id])
        erb :'/workouts/show'
    end

    get '/workouts/:id/edit' do
       @workout = Workout.find_by(params[:id])  
        erb :'workouts/edit'      
    end 

    patch '/workouts/:id' do 
        @workout = Workout.find(params[:id])
        if !params["workout"]["name"].empty? && !params["workout"]["description"].empty?
        @workout.update(params["workout"])
        redirect "/workouts/#{params[:id]}"
        else 
            @error = "Fields must not be empty. Please try again"
            erb :'/workouts/edit'
        end     
    end 
    
    delete '/workouts/:id' do 
        workout = Workout.find(params[:id]) 
        workout.destroy 
        redirect '/workouts'
    end 
end 