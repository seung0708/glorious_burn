class WorkoutsController < ApplicationController
    before '/workouts/*' do 
        require_login
    end

    get '/workouts/new' do
        
        erb :'/workouts/new'
    end 
        
    post '/workouts' do 
      @workout = current_user.workouts.build(name: params[:name], description: params[:description], image: params[:image])
      #binding.pry
       if @workout.save 
          redirect 'workouts'
       else
        flash[:alert] = "Invalid entry. Please try again."
        redirect '/workouts' 
      end
    end 
    
    get '/workouts' do
        @workout = Workout.all.reverse
        if logged_in?
            erb :'/workouts/index'
        else 
            flash[:alert] = "Please login to view workouts"
            redirect "/login"
        end 
    end 

    get '/workouts/:id' do
        @workout = Workout.find(params[:id])
        erb :'/workouts/show'
    end

    get '/workouts/:id/edit' do
       @workout = Workout.find(params[:id])  
        erb :'workouts/edit'      
    end 

    patch '/workouts/:id' do 
        @workout = Workout.find(params[:id])
        if !params["workout"]["name"].empty? && !params["workout"]["description"].empty? 
        @workout.update(params["workout"])
        redirect "/workouts/#{params[:id]}"
        else 
            flash[:alert] = "Fields must not be empty. Please try again"
            erb :'/workouts/edit'
        end     
    end 
    
    delete '/workouts/:id' do 
        workout = Workout.find(params[:id]) 
        workout.destroy 
        redirect '/workouts'
    end 
end 
