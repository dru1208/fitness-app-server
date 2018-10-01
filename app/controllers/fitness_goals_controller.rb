class FitnessGoalsController < ApplicationController
  def create
    user = User.find params[:user_id]
    @goal = user.fitness_goals.new(fitness_goals_params)

    if @goal.save
      render json: @goal
    else
      render json: {
        status: "Failed",
        message: "Did not save to database"
      }
    end
  end

  def destroy
    @goal = FitnessGoal.find(params[:id])
    if @goal.destroy
      @goals = FitnessGoal.select(:id, :description, :datetime, :completed).where("user_id = " + params[:user_id].to_s)
      render json: @goals
    else
      render json: false
    end
  end

  def index
    goals = FitnessGoal.select(:id, :description, :datetime, :completed).where("user_id = " + params[:user_id].to_s)
    render json: goals
  end

  def update
    goal = FitnessGoal.update(params[:id], completed: params[:completed])
  end

  private
    def fitness_goals_params
      params.permit(:user_id, :description, :datetime)
    end
end