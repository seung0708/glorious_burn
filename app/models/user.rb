class User < ActiveRecord::Base
    has_many :workouts
    has_many :workoutlogs
    accepts_nested_attributes_for :workoutlogs
    has_secure_password
    validates :username, :password, presence: true
    validates_uniqueness_of :username
end     