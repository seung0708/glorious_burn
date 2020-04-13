require './config/environment'

class ApplicationController < Sinatra::Base
 

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    # session_secret not only encrypts the session, but validates to be used
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    #sinatra method
    # helpers make the methods defined in the block accessible to the controllers and views
    #shared backend functionality to consolidate

    def logged_in?
      !!current_user
      # double converts truthy/falsey values to true/false (boolean)
    end 
  
    def current_user
      @user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
      # if there is a value in session[:user_id], try to find a user whose id is equal to that session[:user_id] and then assign that user to @user
    end

    def require_login 
      if !logged_in? 
        flash[:notice] = "You must be logged in."
        redirect '/login'
      end
    end

  end 

end
