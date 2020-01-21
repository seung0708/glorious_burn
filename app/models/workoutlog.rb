class Workoutlog < ActiveRecord::Base
    belongs_to :user, :class_name => "User", :foreign_key => "user_id"
    #validates_presence_of :created_at, :workout_name, :num_of_sets, :num_of_reps

end 