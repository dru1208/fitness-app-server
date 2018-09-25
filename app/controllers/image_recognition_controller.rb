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
      imageFoodName = ImageRecognitionController.convertImageJSONNutrition(foodResult)
      newUser = NutritionSearchController.searchResultSave(imageFoodName)
      puts newUser





    end

    respond_to do |format|
      msg = { :status => "Success", :message => foodResult }
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def self.convertImageJSONNutrition(json)
    result = json['images'][0]['classifiers'][0]['classes'][0]['class']
  end


end
