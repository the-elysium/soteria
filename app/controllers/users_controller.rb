class UsersController < ApplicationController
  def index

    if current_user.nil?
      payload = {
        error: "Login is required.",
        status: 401
      }
      render json: payload, status: :unauthorized
    else
      payload = {
        status: 200,
        data: current_user
      }
      render json: payload, status: :ok
    end
  end
end
