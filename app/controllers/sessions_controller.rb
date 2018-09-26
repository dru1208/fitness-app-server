class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
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
