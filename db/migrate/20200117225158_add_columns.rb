class AddColumns < ActiveRecord::Migration
  def change
    add_column :workout_logs, :workout_name, :string
    add_column :workout_logs, :created_at, :datetime
  end
end
