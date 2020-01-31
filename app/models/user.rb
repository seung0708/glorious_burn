class User < ActiveRecord::Base
    has_many :workoutlogs
    has_many :workouts, through: :workoutlogs
    has_many :workouts, :foreign_key => :user_id
    has_secure_password
    validates :username, :password, presence: true
    validates_uniqueness_of :username
end     