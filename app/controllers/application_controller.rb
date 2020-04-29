require './config/environment'

class ApplicationController < Sinatra::Base
 

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def logged_in?
      !!current_user
    end 
  
    def current_user
      @user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
    end

    def require_login 
      if !logged_in? 
        flash[:alert] = "You must be logged in."
        redirect '/login'
      end
    end

    def redirect_if_not_owner
      if current_user.id != @workoutlog.user_id
        flash[:alert] = "Unauthorized access. Please login to view this page."
        redirect '/workoutlogs'
      end
    end 

  end 

end
