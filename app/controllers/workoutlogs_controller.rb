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
      if  @workoutlog.save 
         redirect '/workoutlogs'
       else
         flash[:alert] = "No data entered. Please try again."
         redirect '/workoutlogs/new'  
     end
   end  

   get '/workoutlogs' do
     @workoutlog = Workoutlog.all
     erb :'workoutlogs/index'
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
      #binding.pry
        if @workoutlog
          @workoutlog.update(params[:workoutlog])
           redirect "/workoutlogs"
      else 
         flash[:alert] = "Invalid Entry. Please try again"
         erb :'/workoutlogs/edit'
      end
   end 

   delete '/workoutlogs/:id' do 
     workoutlog = Workoutlog.find(params[:id])
        workoutlog.destroy 
        redirect '/workoutlogs'
   end 

end 