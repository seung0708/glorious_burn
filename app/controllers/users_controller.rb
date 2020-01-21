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
            @error = "Fields cannot be empty"
            erb :'/users/signup'       
        end 
    end

end