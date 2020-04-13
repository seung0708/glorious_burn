Sinatra Project

This project is based on a workout tracker. The idea of the application is that a user is able to log their workouts and add workouts to the database so that they can log those workouts too. 

The user will be able to login and as soon as they login, they will see all of the workouts that they tracked showing the dates, workout name, number of sets, and number of reps. 

The user should be able to edit the workouts if they make a mistake and should only be able to see their workouts, not other users. 

There are a lot of standard workouts out there, but there are workouts that are personally/professionaly developed. These kinds of workouts make it hard to find. 

For these kinds of workouts, the user will be able to add them and include them into their workoutlog. The user can add the workoutname, a short description of the workout, and an image if available.

# Build an MVC Sinatra Application
# Use ActiveRecord with Sinatra
# Use mulitple models
# Use at least one has_many relationship and one belongs_to relationship on another model
# Must have user accounts - users might be able to sign up, sign in, and sign out
# Validate uniqueness of user login attribute (username or email)
# Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user
# Ensure that users can edit and delete only their own resources - not resources created by otehr users
# Validate user input so bade data cannot be persisted to the database
# Bonus: Display validation failures to user with error messages