class CreateWorkoutLogs < ActiveRecord::Migration
  def change
    create_table :workout_logs do |t|
      t.integer :user_id
      t.integer :workout_id
      t.integer :num_of_sets
      t.integer :num_of_reps
      t.datetime :workout_date, :created_at
  end
end
end
