class UsersController < ApplicationController

    get '/signup' do 
        erb :'users/signup'
    end 

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/workoutlogs'
        else 
            @error = "Username already used"
            erb :'/users/signup'       
        end 
    end

end