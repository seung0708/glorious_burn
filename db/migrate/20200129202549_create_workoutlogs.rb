class CreateWorkoutlogs < ActiveRecord::Migration
  def change
    create_table :workoutlogs do |t|
      t.datetime :created_at
      t.integer :user_id
      t.integer :workout_id
      t.integer :sets
      t.integer :reps
    end
  end
end
