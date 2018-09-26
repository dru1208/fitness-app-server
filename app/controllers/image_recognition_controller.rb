require 'uri'
require 'ibm_watson'

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
      puts JSON.pretty_generate(foodResult)
    end

    render :json foodResult
  end

end
