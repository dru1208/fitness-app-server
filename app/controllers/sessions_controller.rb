class SessionsController < ApplicationController
  def self.generate_jwt(payload)
    super(payload)
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      payload = {
        firstName: @user[:first_name],
        userID: @user[:id],
        email: @user[:email]}
      jwt = SessionsController.generate_jwt(payload)
      render json: jwt
    else
      render json: false
    end
  end

end
