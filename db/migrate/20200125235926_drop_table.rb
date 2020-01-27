class DropTable < ActiveRecord::Migration
  def change
    drop_table :workouts_to_workoutlogs
  end
end
