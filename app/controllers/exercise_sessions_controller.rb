class ExerciseSessionsController < ApplicationController
  def index

    @exercise_sessions = ExerciseSession.all.select(:datetime, :minutes)

    render json: @exercise_sessions
  end

  def create
    user = User.find params[:user_id]
    exercise_session = user.exercise_sessions.new(exercise_session_params)

    if exercise_session.save
        render json: exercise_session
        puts "it worked!!!!!!!!!!"
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