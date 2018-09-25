class UserNutritionsController < ApplicationController
  def index
    nutrition = UserNutrition.all.select(:calories, :protein, :fat, :carbohydrates, :sugar)
    render json: nutrition
  end
end
