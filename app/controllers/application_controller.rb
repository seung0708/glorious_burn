require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
 
  get "/" do
    erb :welcome
  end

  def logged_in?
    !!current_user
  end 

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  #def workouts 
   #Workout.find_or_create_by(id: params[id])
  #end 

  def require_login 
    unless logged_in? 
      redirect '/login'
    end
  end

end
