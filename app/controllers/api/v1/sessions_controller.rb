class Api::V1::SessionsController < ApplicationController

  def index
    user_found = User.find_by(email: params[:email])
    if user_found && user_found.authenticate(params[:password])
      render json: UserSerializer.create_user(user_found), status: 200
    else
      render json: {error: "Invalid Credentials, Try Again"}, status: 400
    end
  end
end
