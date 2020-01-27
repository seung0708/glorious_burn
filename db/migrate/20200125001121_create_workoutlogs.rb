class CreateWorkoutlogs < ActiveRecord::Migration
  def change
    create_table :workoutlogs do |t|
      t.integer :user_id
      t.integer :reps
      t.datetime :created_at
    end 
  end
end
