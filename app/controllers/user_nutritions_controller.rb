class UserNutritionsController < ApplicationController
  def self.generate_jwt(payload)
    super(payload)
  end

  def self.decode_jwt (jwt)
    super(jwt)
  end


  def index
    jwt = request.headers["HTTP_AUTHORIZATION"]
    decoded_jwt = UserNutritionsController.decode_jwt(jwt)
    user_id = decoded_jwt[0]["userID"]
    puts user_id
    nutritionList = UserNutrition.select(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime, :sodium, :cholesterol, :serving_size, :meal_query).where("user_id = " + user_id.to_s)

    render json: nutritionList

  end


  def create
    user = User.find params[:user_id]
    user_nutrition = user.user_nutritions.new(nutrition_params)
    if user_nutrition.save
      puts "you've saved"
      nutritionList = UserNutrition.select(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime, :sodium, :cholesterol, :serving_size, :meal_query).where("user_id = " + params[:user_id].to_s)
      render json: nutritionList
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
