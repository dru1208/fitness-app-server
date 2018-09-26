class UsersController < ApplicationController
  def self.generate_jwt(payload)
    super(payload)
  end

  def create
    @user = User.new(first_name: params[:firstName],
      last_name: params[:lastName],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:passwordConfirmation],
      location: params[:location])
    if @user.save
      payload = {
        firstName: @user[:first_name],
        userID: @user[:id],
        email: @user[:email]}
      jwt = UsersController.generate_jwt(payload)
      render json: jwt
    else
      render json: false
    end
  end

end
