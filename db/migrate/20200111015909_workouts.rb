class Workouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name 
      t.text :description
      t.string :image
      t.integer :user_id
    end 
  end
end
