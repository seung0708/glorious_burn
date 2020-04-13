class Workout < ActiveRecord::Base
    has_many :workoutlogs, inverse_of: :workouts
    has_many :users, through: :workoutlogs
    belongs_to :user
    validates :name, :description, presence: true
end  