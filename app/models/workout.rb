class Workout < ActiveRecord::Base
    has_many :workoutlogs
    has_many :users, through: :workoutlogs
    validates :name, :description, presence: true
end  