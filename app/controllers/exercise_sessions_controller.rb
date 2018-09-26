class ExerciseSessionsController < ApplicationController
  def index
    exercise_sessions = ExerciseSession.all.select(:datetime, :minutes)
    puts "cdscds"
    render json: exercise_sessions
  end
end
