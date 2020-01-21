class RenameTable < ActiveRecord::Migration
  def change
    rename_table :workout_logs, :workoutlogs
  end
end
