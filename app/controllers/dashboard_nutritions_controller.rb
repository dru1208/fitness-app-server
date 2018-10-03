class DashboardNutritionsController < ApplicationController
  def index
    last_date_time = UserNutrition.where("user_id = " + params[:user_id].to_s).maximum("datetime")
    if last_date_time
      last_date_adjusted = last_date_time - (60 * 60 * 24)


      calories = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime >= '#{last_date_adjusted.to_s}'").sum(:calories)
      protein = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime >= '#{last_date_adjusted.to_s}'").sum(:protein)
      fat = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime >= '#{last_date_adjusted.to_s}'").sum(:fat)
      carbohydrates = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime >= '#{last_date_adjusted.to_s}'").sum(:carbohydrates)
      sugar = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime >= '#{last_date_adjusted.to_s}'").sum(:sugar)
      sodium = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime >= '#{last_date_adjusted.to_s}'").sum(:sodium)
      cholesterol = UserNutrition.where("user_id = " + params[:user_id].to_s + " AND datetime >= '#{last_date_adjusted.to_s}'").sum(:cholesterol)



      nutritionSummary = {
        calories: calories,
        protein: protein,
        fat: fat,
        carbohydrates: carbohydrates,
        sugar: sugar,
        sodium: sodium,
        cholesterol: cholesterol
      }

      puts "nutrition summary: " + nutritionSummary.inspect
      render json: nutritionSummary
    else
      render json: false
    end
  end
end
