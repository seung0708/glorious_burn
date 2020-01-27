class Associatelog < ActiveRecord::Base
    belongs_to :workoutlog 
    belongs_to :workout
end 