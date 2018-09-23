class ExerciseSessionsController < ApplicationController
  def index
    exercise_sessions = ExerciseSession.all.select(:datetime, :minutes)
    render json: exercise_sessions
  end
end
