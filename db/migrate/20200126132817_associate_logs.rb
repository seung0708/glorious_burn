class AssociateLogs < ActiveRecord::Migration
  def change
      create_table :associatelogs do |t|
        t.integer :workoutlog_id
        t.integer :workout_id
      end 
  end
end
