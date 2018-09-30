class ExerciseSessionsController < ApplicationController
  def index
    # puts "beginning of week: " + Date.current.beginning_of_week(start_day = :sunday).to_s
    # @exercise_sessions = ExerciseSession.select(:datetime, :minutes).where("user_id = " + params[:user_id] + " AND week_of = '" + Date.current.beginning_of_week(start_day = :sunday).to_s + "'")
    # puts "exercise_sessions is: " + @exercise_sessions.inspect
    # render json: @exercise_sessions
  end

  def create
    user = User.find params[:user_id]
    exercise_session = user.exercise_sessions.new(exercise_session_params)

    if exercise_session.save
        render json: exercise_session
    else
        render json: {
          status: "Failed",
          message: "Did not save to database"
        }
    end
    # render json: @exercise_sessions

  end
  private
    def exercise_session_params
      params.permit(:user_id, :minutes, :datetime)
    end

end


# add in something to find exercise sessions by the last sunday