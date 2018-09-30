class FitnessGoalsController < ApplicationController
  def create
    @goal = FitnessGoal.create(description: params[:description], datetime: params[:datetime], user_id: 1)
  end

  def destroy
    @goal = FitnessGoal.find(params[:id])
  end

  def index
    goals = FitnessGoal.select(:id, :description, :datetime, :completed)
    render json: goals
  end

  def update
    goal = FitnessGoal.update(params[:id], completed: params[:completed])
  end
end