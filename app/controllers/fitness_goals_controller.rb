class FitnessGoalsController < ApplicationController
  def index
    goals = FitnessGoal.all.select(:description, :datetime)
    render json: goals
  end
end