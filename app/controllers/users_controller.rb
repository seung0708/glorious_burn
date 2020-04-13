class UsersController < ApplicationController

    get '/signup' do 
    
        erb :'users/signup' # renders the sign up page 
    end 

    post '/signup' do
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            redirect '/workoutlogs'
        else 
            flash[:alert] = "Username already used"
            erb :'/users/signup'       
        end 
    end

end