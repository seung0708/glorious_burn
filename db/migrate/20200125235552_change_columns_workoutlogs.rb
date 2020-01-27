class ChangeColumnsWorkoutlogs < ActiveRecord::Migration
  def change
      add_column :workoutlogs, :name, :string
  end
end
