class UserNutritionsController < ApplicationController
  def index
    nutrition = UserNutrition.select(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar).where("user_id = " + params[:user_id])
    render json: nutrition

  end


  def create
    user = User.find params[:user_id]
    user_nutrition = user.user_nutritions.new(nutrition_params)
    if user_nutrition.save
      render json: user_nutrition
    else
      render json: {
        status: "Failed",
        message: "Nutritional information did not save to database"
      }
    end
  end


  private
      def nutrition_params
        params.permit(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime)
      end
end
