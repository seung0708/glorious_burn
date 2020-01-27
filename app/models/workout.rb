class Workout < ActiveRecord::Base
    belongs_to :user
    has_many :associatelogs
    has_many :workoutlogs, through: :associatelogs
    #accepts_nested_attributes_for :workoutlogs
    validates_presence_of :name, :description
end  