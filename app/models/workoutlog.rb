class Workoutlog < ActiveRecord::Base
    belongs_to :user
    has_many :associatelogs
    has_many :workouts, through: :associatelogs
    accepts_nested_attributes_for :workouts
    validates_presence_of :created_at, :sets, :reps, presence => true

end 