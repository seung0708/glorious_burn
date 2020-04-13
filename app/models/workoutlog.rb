class Workoutlog < ActiveRecord::Base
    belongs_to :user
    belongs_to :workout
    validates_presence_of :created_at, :sets, :reps
end 