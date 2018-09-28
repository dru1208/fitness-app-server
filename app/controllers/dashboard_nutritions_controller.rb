class DashboardNutritionsController < ApplicationController
  def index
    last_date = UserNutrition.where("user_id = " + params[:user_id].to_s).order('datetime DESC').last['datetime']
    calories = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime = '#{last_date.to_s}'").sum(:calories)
    protein = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime = '#{last_date.to_s}'").sum(:protein)
    fat = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime = '#{last_date.to_s}'").sum(:fat)
    carbohydrates = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime = '#{last_date.to_s}'").sum(:carbohydrates)
    sugar = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime = '#{last_date.to_s}'").sum(:sugar)
    sodium = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime = '#{last_date.to_s}'").sum(:sodium)
    cholesterol = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime = '#{last_date.to_s}'").sum(:cholesterol)



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
