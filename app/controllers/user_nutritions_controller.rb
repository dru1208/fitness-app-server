class UserNutritionsController < ApplicationController
  def index
    nutritionList = UserNutrition.select(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime, :sodium, :cholesterol, :serving_size, :meal_query).where("user_id = " + params[:user_id].to_s)

    render json: nutritionList
  end

  def create
    user = User.find params[:user_id]
    user_nutrition = user.user_nutritions.new(nutrition_params)
    if user_nutrition.save
      puts "you've saved"
      nutrition = UserNutrition.select(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime, :sodium, :cholesterol, :serving_size, :meal_query).where("user_id = " + params[:user_id].to_s)
      render json: nutrition
    else
      render json: false
    end
  end

  def update

  end

  private
      def nutrition_params
        params.permit(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime, :sodium, :cholesterol, :serving_size, :meal_query)
      end
end
