ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

#Configured ActiveRecord into the environment. 
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3", #connecting through a sqlite3 database
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite" #storing data into the database
)

require './app/controllers/application_controller'
#require 'httparty'
require 'pry'
require_all 'app'
require 'sinatra'