class NutritionSearchController < ApplicationController

  def self.searchResultSave (name, id, inputTime)
    response = HTTP.headers(:accept => 'application/json',
      :"x-app-id" => ENV['NUTRITIONIX_APP_ID'],
      :"x-app-key" => ENV['NUTRITIONIX_APP_KEY'],
      :"x-remote-user-id" => '0')
      .post('https://trackapi.nutritionix.com/v2/natural/nutrients', :json => {:query => name})
    foodResponse = JSON.parse(response.body)
    if foodResponse["foods"]
      foodName = foodResponse["foods"][0]["food_name"]
      foodCalories = foodResponse["foods"][0]["nf_calories"]
      foodFat = foodResponse["foods"][0]["nf_total_fat"]
      foodCholesterol = foodResponse["foods"][0]["nf_cholesterol"]
      foodSodium = foodResponse["foods"][0]["nf_sodium"]
      foodCarbs = foodResponse["foods"][0]["nf_total_carbohydrate"]
      foodSugars = foodResponse["foods"][0]["nf_sugars"]
      foodProtein = foodResponse["foods"][0]["nf_protein"]
      UserNutrition.create(user_id: id,
        calories: foodCalories,
        fat: foodFat,
        cholesterol: foodCholesterol,
        sodium: foodSodium,
        carbohydrates: foodCarbs,
        sugar: foodSugars,
        protein: foodProtein,
        datetime: inputTime,
        meal_query: name)
    end
  end

  def create
    inputTime = DateTime.parse(params[:datetime])
    NutritionSearchController.searchResultSave(params[:query], params[:user_id], inputTime)
    nutritionList = UserNutrition.select(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime, :sodium, :cholesterol, :serving_size, :meal_query).where("user_id = " + params[:user_id].to_s)
    render json: nutritionList
  end

end
