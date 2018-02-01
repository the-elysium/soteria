class SystemController < ApplicationController
  def public_key
    key = Rails.configuration.encryption["public_key"]

    payload = {
      status: 200,
      public_key: key
    }

    render json: payload, status: :ok
  end
end
