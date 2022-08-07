class Api::V1::UsersController < ApplicationController

  def create
      new_user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.hex)
      if new_user.save
        render json: UserSerializer.create_user(new_user), status: 201
      else
        render json: {error: new_user.errors.full_messages.to_sentence}, status: 400
      end
    end
  end
