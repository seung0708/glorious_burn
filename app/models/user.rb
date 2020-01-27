class User < ActiveRecord::Base
    has_many :workoutlogs
    has_many :workouts
    has_secure_password
    validates :username, :password, presence: true
    validates_uniqueness_of :username
end     