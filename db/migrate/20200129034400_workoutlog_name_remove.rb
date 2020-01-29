class WorkoutlogNameRemove < ActiveRecord::Migration
  def change
    remove_column :workoutlogs, :name, :string
  end
end
