class Workout < ActiveRecord::Base
    has_many :workoutlogs, inverse_of: :workout
    has_many :users, through: :workoutlogs
    belongs_to :user, class_name: 'User'
    validates_presence_of :name, :description
end  