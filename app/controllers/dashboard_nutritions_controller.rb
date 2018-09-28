class DashboardNutritionsController < ApplicationController
  def index
    calories = UserNutrition.where(:user_id => params[:user_id]).sum(:calories)
    protein = UserNutrition.where("user_id = " + params[:user_id]).sum(:protein)
    fat = UserNutrition.where("user_id = " + params[:user_id]).sum(:fat)
    carbohydrates = UserNutrition.where("user_id = " + params[:user_id]).sum(:carbohydrates)
    sugar = UserNutrition.where("user_id = " + params[:user_id]).sum(:sugar)
    sodium = UserNutrition.where("user_id = " + params[:user_id]).sum(:sodium)
    cholesterol = UserNutrition.where("user_id = " + params[:user_id]).sum(:cholesterol)



    nutritionSummary = {
      calories: calories,
      protein: protein,
      fat: fat,
      carbohydrates: carbohydrates,
      sugar: sugar,
      sodium: sodium,
      cholesterol: cholesterol
    }

    render json: nutritionSummary
  end
end
