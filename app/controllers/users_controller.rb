class UsersController < ApplicationController
  def self.generate_jwt(payload)
    super(payload)
  end

  def create
    image = params[:image]
    imageName = params[:imageName]
    imageUrl = 'http://localhost:3000/images/profile-pictures/' + imageName
    f = File.new('./public/images/profile-pictures/' + imageName, 'wb')
    f.write(Base64.decode64(image))
    f.close

    @user = User.new(first_name: params[:firstName],
      last_name: params[:lastName],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:passwordConfirmation],
      location: params[:location],
      profile_picture: imageUrl
    )

    if @user.save
      payload = {
        firstName: @user[:first_name],
        userID: @user[:id],
        email: @user[:email],
        location: @user[:location]
      }
      jwt = UsersController.generate_jwt(payload)
      render json: jwt
    else
      render json: false
    end
  end

  def update
    # user = User.update(params[:user_id], location: params[:location])
    @user = User.find(params[:id])
    puts @user.inspect
   @user.update_attributes({location: params[:location], password: params[:password]})
   puts @user.errors.full_messages.inspect
    # if @user.update_attributes({location: params[:location]})
    #   puts "updated"
    #   render json: {location: @user.location}
    # else
    #   render json: false
    # end
    render json: {location: @user.location}
  end

end
