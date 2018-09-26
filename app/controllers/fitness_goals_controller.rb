class FitnessGoalsController < ApplicationController
  def create
    @goal = FitnessGoal.create(description: params[:description], datetime: params[:datetime], user_id: 1)
  end

  def destroy
    @goal = FitnessGoal.find(params[:id])
  end

  def index
    goals = FitnessGoal.all.select(:description, :datetime)
    render json: goals
  end
end