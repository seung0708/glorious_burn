class Workoutlog < ActiveRecord::Base
    belongs_to :user
    belongs_to :workout, inverse_of: :workoutlogs
    accepts_nested_attributes_for :workout
    validates_presence_of :created_at, :sets, :reps, :workout, presence => true

end 