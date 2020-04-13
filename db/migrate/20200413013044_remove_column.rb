class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :workouts, :user_id, :integer
  end
end
