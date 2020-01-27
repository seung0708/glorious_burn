class AddColumn < ActiveRecord::Migration
  def change
    add_column :workoutlogs, :sets, :integer
  end
end
