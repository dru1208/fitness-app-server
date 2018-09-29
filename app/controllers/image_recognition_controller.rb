require 'uri'
require 'ibm_watson'
require 'json'
require 'http'



class ImageRecognitionController < ApplicationController
  def create
    apikey = params[:apikey]
    image = params[:image]
    imageName = params[:imageName]
    foodResult = nil

    visual_recognition = IBMWatson::VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: ENV['WATSON_API_KEY']
    )

    f = File.new('./public/images/' + imageName, 'wb')
    f.write(Base64.decode64(image))
    f.close

    File.open('./public/images/' + imageName) do |image_file|
      foodResult = visual_recognition.classify(
        images_file: image_file,
        threshold: 0.1
      ).result
      # puts JSON.pretty_generate(foodResult)
      inputTime = DateTime.parse(params[:datetime])
      imageFoodName = ImageRecognitionController.convertImageJSONNutrition(foodResult)
      newUser = NutritionSearchController.searchResultSave(imageFoodName, params[:user_id], inputTime)
      puts newUser
    end

    nutritionList = UserNutrition.select(:user_id, :calories, :protein, :fat, :carbohydrates, :sugar, :datetime, :sodium, :cholesterol, :serving_size, :meal_query).where("user_id = " + params[:user_id].to_s)
    render json: nutritionList
  end

  def self.convertImageJSONNutrition(json)
    result = json['images'][0]['classifiers'][0]['classes'][0]['class']
  end


end
