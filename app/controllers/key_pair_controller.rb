require 'base64'

class KeyPairController < ApplicationController
  def show
    if current_user.nil?
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:unauthorized]

      payload = {
        error: "Login is required.",
        status: status
      }

      render json: payload, status: status

    elsif current_user.key_pair.nil? 
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:not_found]

      payload = {
        error: "Key pair is not created.",
        status: status
      }

      render json: payload, status: status
    else
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:ok]

      payload = {
        status: status,
        keypair: current_user.key_pair
      }

      render json: payload, status: status
    end
  end


  def new

    if current_user.nil?
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:unauthorized]

      payload = {
        error: "Login is required.",
        status: status
      }

      render json: payload, status: status

    elsif not current_user.key_pair.nil? 
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request]

      payload = {
        error: "Key pair exists.",
        status: status
      }

      render json: payload, status: status
    else
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:ok]
      cryptographer = Cryptographer.new
      key = cryptographer.create_key_pair(pk_password: params[:pk_password])

      keypair = KeyPair.new
      keypair.user = current_user
      keypair.public_key = key[:public_key]
      
      secret = cryptographer.create_secret
      keypair.secret = cryptographer.sys_pub_key_encrypt(secret.to_json)
      
      if(params[:keep_private_key])
        keypair.private_key = cryptographer.encrypt(key[:private_key], secret)
      end

      if(params[:keep_pk_password])
        keypair.password = cryptographer.encrypt(key[:pk_password], secret)
      end

      keypair.save!
      payload = {
        status: status,
        data: {
          public_key: key[:public_key],
          private_key: key[:private_key]
        }
      }

      render json: payload, status: status
    end

  end

  def upload
    if current_user.nil?
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:unauthorized]

      payload = {
        error: "Login is required.",
        status: status
      }

      render json: payload, status: status

    elsif not current_user.key_pair.nil? 
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request]

      payload = {
        error: "Key pair exists.",
        status: status
      }

      render json: payload, status: status
    else
      
    end
  end

  def update
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:not_implemented]
    payload = {
      error: "Not implemented.",
      status: status
    }
    render json: payload, status: status
  end
end
