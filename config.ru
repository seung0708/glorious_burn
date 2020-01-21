require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#use Workouts::API
use Rack::MethodOverride
use WorkoutlogController
use WorkoutsController
use UsersController
use SessionsController
run ApplicationController
