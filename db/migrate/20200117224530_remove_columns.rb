class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :workout_logs, :workout_id, :string
    remove_column :workout_logs, :workout_date, :datetime
    remove_column :workout_logs, :created_at, :datetime
  end
end
