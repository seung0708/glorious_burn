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
      if  @workoutlog.save 
         redirect '/workoutlogs'
       else
         flash[:alert] = "No data entered. Please try again."
         redirect '/workoutlogs/new'  
     end
   end  

   get '/workoutlogs' do
      if current_user.workoutlogs.exists? || !current_user.workoutlogs.exists?
        @workoutlog
        erb :'workoutlogs/index'
      else 
        flash[:alert] = "Not signed in. Please login to your account"
        redirect '/workoutlogs/new'  
      end
   end 

   get '/workoutlogs/:id' do
     @workoutlog = Workoutlog.find(params[:id])
     redirect_if_not_owner
     erb :'/workoutlogs/show'  
   end

   get '/workoutlogs/:id/edit' do
     @workoutlog = Workoutlog.find(params[:id])
      redirect_if_not_owner
      erb :'workoutlogs/edit'  
   end

   patch '/workoutlogs/:id' do 
      @workoutlog = Workoutlog.find(params[:id])
      redirect_if_not_owner
      if @workoutlog.update(params[:workoutlog])
           redirect "/workoutlogs"
      else 
         flash[:alert] = "Invalid Entry. Please try again"
         erb :'/workoutlogs/edit'
      end
   end 

   delete '/workoutlogs/:id' do 
     @workoutlog = Workoutlog.find(params[:id])
     @workoutlog.destroy
     redirect '/workoutlogs'
    end 

end 