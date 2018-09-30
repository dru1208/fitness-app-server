class ExerciseSessionsController < ApplicationController
  def index
    @exercise_sessions = ExerciseSession.select(:datetime, :minutes).where("user_id = " + params[:user_id] + " AND week_of = '" + Date.current.beginning_of_week(start_day = :sunday).to_s + "'")
    render json: @exercise_sessions
  end

  def create
    exerciseDate = params[:datetime].to_date
    user = User.find params[:user_id]
    exercise_session = user.exercise_sessions.new(exercise_session_params)
    exercise_session.week_of = exerciseDate.beginning_of_week(start_day = :sunday).to_s

    if exercise_session.save
      render json: exercise_session
    else
      render json: {
        status: "Failed",
        message: "Did not save to database"
      }
    end

  end
  private
    def exercise_session_params
      params.permit(:user_id, :minutes, :datetime)
    end
end