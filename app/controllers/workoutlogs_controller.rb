class WorkoutlogController < ApplicationController
    before '/workoutlogs/*' do 
        require_login
    end
    
    get '/workoutlogs/new' do
    @workout = Workout.all
     
        erb :'/workoutlogs/new'
     
    end 
    
   post '/workoutlogs' do 
    @workoutlog = current_user.workoutlogs.build(params[:workoutlog])
    #binding.pry
    @workoutlog.workout = Workout.find(params[:workoutlog][:workout_id])
      if  @workoutlog.save 
         redirect '/workoutlogs'
       else
         flash[:alert] = "No data entered. Please try again."
         redirect '/workoutlogs/new'  
     end
   end  

   get '/workoutlogs' do
    if logged_in?
     @workoutlog = Workoutlog.all
     erb :'workoutlogs/index'
    else 
      flash[:alert] = "Please login to view this page"
      redirect '/login'
    end 
   end 

   get '/workoutlogs/:id' do
     @workoutlog = Workoutlog.find(params[:id])
     
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
     end
   end 


   delete '/workoutlogs/:id' do 
     workoutlog = Workoutlog.find(params[:id])
        workoutlog.destroy 
        redirect '/workoutlogs'
   end 

end 